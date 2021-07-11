#!/usr/bin/env python

# Plot detections from a training dataset.

import argparse
import math
import os

import numpy as np
from PIL import Image, ImageDraw


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("--image", type=str, required=True)
    parser.add_argument("--labels", type=str, required=True)
    parser.add_argument("--outfile", type=str, required=True)
    args = parser.parse_args()

    img = Image.open(args.image)
    draw = ImageDraw.Draw(img)

    with open(args.labels, "r") as labelfile:
        labels = np.array(
            [x.split() for x in labelfile.read().strip().splitlines()], dtype=np.float32
        )  # lab
        assert labels.shape[1] == 5, "labels require 5 columns each"
        assert (labels >= 0).all(), "negative labels"
        assert (
            labels[:, 1:] <= 1
        ).all(), "non-normalized or out of bounds coordinate labels"

    for label in labels:
        # The labels data in the COCO dataset used by the Yolov3 code is in the format:
        #   classID box_center_x box_center_y box_width box_height
        classid = label[0]
        bx, by, bw, bh = label[1:]
        bx *= math.floor(img.width)
        by *= math.floor(img.height)
        bw *= math.floor(img.width)
        bh *= math.floor(img.height)

        left = bx - (bw / 2)
        upper = by - (bh / 2)
        right = bx + (bw / 2)
        lower = by + (bh / 2)
        draw.rectangle(
            (left, upper, right, lower), outline=(0, 255, 0), fill=None, width=1
        )
        draw.text((left, upper), str(classid), (0, 255, 0))

    img.save(args.outfile)
    print(f"Wrote {args.outfile} with {len(labels)} detections")


if __name__ == "__main__":
    main()
