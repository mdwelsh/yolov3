#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

python ./detect.py \
  --source $HOME/datasets/bricklens/test_images \
  --weights bricklens-yolov3/exp12/weights/best.pt
