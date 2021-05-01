#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

python ./detect.py \
  --source $HOME/datasets/mscoco/val2017 \
  --weights runs/train/exp5/weights/best.pt
