#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

python ./detect.py \
  --device cpu \
  --source $HOME/datasets/bricklens/test_images \
  --weights bricklens-yolov3/exp20/weights/best.pt
