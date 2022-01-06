#!/usr/bin/env python3

# Simple tool to evaluate models in a standalone fashion.

import argparse
from pathlib import Path

import cv2
import numpy as np
import torch
from torch.jit.mobile import _load_for_lite_interpreter

from utils.datasets import letterbox


def eval_bricklens_model(args):
    # Load model.
    if args.torchscript_file:
        print(f"Loading Torchscript model: {args.torchscript_file}")
        model = torch.load(args.torchscript_file)
        model.eval()
    elif args.lite_file:
        print(f"Loading PyTorch Lite model: {args.lite_file}")
        model = _load_for_lite_interpreter(args.lite_file)
    elif args.weights_file:
        print(f"Loading weights: {args.weights_file}")
        model = torch.load(args.weights_file)['model'].float().fuse().eval()
        model.eval()

    print(f"Model is:\n{model}")

    # Load image.
    img0 = cv2.imread(args.image_file)  # BGR
    assert img0 is not None, "Image not found: " + args.image_file
    # Padded resize
    img = letterbox(img0, new_shape=args.image_size)[0]
    # Convert
    img = img[:, :, ::-1].transpose(2, 0, 1)  # BGR to RGB, to 3x416x416
    img = np.ascontiguousarray(img)

    img = torch.from_numpy(img).to("cpu")
    img = img.float()
    img /= 255.0  # 0 - 255 to 0.0 - 1.0
    if img.ndimension() == 3:
        img = img.unsqueeze(0)
    print(f"Input image is: {type(img)} {img.shape} {img.dtype}")
    result = model(img)
    print(f"Result is: {type(result)}")

    if args.lite_file:
        # The wrapped model from export.py only returns its first output.
        pred = result
    else:
        # The non-wrapped model.
        pred = result[0]

    print(f"Pred is: {type(pred)} {pred.shape} {pred.dtype}")
    xc = pred[..., 4] > args.conf_thres
    for xi, x in enumerate(pred):  # image index, image inference
        print(f"Pred [{xi}] has shape {x.shape}")
        x = x[xc[xi]]  # confidence filter
        print(
            f"Pred [{xi}] after filtering with confidence threshold "
            f"{args.conf_thres} has shape {x.shape}"
        )
        for val in x:
            print(val)



def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--weights-file", default="./bricklens-yolov3/exp24/weights/best.pt")
    parser.add_argument("--torchscript-file")
    parser.add_argument("--lite-file")
    parser.add_argument("--image-size", default=512)
    parser.add_argument("--image-file", type=str, required=True)
    parser.add_argument("--conf-thres", type=float, default=0.7)
    args = parser.parse_args()
    eval_bricklens_model(args)


if __name__ == "__main__":
    main()
