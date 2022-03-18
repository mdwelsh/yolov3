#!/usr/bin/env python3

# Export a trained model to PyTorch Lite.

import argparse
from pathlib import Path

import torch
import torch.nn as nn
from torch.utils.mobile_optimizer import optimize_for_mobile

from models.experimental import attempt_load
from utils.general import check_img_size


class ReturnFirstElement(nn.Module):
    """Trivial nn.Module that returns only the first element from a list.

    This is necessary because the models return both their predictions as well
    as their loss values at runtime. We need to strip off the loss values, since
    returning a list as an inference result does not currently play nice with
    PyTorch Live on iOS.
    """
    def forward(self, x):
        return x[0]


def export_model(weights_file: str, spec_file: str, output_file: str, imgsz: int):
    print(f"Exporting model from {weights_file}")
    device = torch.device("cpu")

    # Load model.
    model = attempt_load(weights_file, map_location=device)  # load FP32 model
    imgsz = check_img_size(imgsz, s=model.stride.max())  # check img_size

    # Wrap model in a ReturnFirstElement module so it only returns the model predictions.
    model = nn.Sequential(model, ReturnFirstElement())

    model.eval()
    randimg = torch.rand((1, 3, imgsz, imgsz), device=device)  # init img
    randimg = randimg.float()  # uint8 to fp16/32

    # Trace model.
    traced_script_module = torch.jit.trace(model, randimg, check_trace=False)

    # Optimize for mobile and save for Lite interpreter.
    optimized_model = optimize_for_mobile(traced_script_module)
    spec = Path(spec_file).read_text()
    extra_files = {}
    extra_files["model/live.spec.json"] = spec
    optimized_model._save_for_lite_interpreter(output_file, _extra_files=extra_files)
    print(f"Saved: {output_file}")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--weights-file", default="./bricklens-yolov3/exp29/weights/best.pt"
    )
    parser.add_argument("--spec-file", default="./bricklens_lite.ptl.live.spec.json")
    parser.add_argument("--output-file", default="bricklens_lite_exp29.ptl")
    parser.add_argument("--img-size", type=int, default=640)
    args = parser.parse_args()

    export_model(args.weights_file, args.spec_file, args.output_file, args.img_size)


if __name__ == "__main__":
    main()
