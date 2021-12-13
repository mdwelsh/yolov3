#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

python ./detect.py \
  --conf-thres 0.05 \
  --source $HOME/datasets/bricklens/test_images \
  --weights bricklens-yolov3/exp22/weights/best.pt
#  --device cpu \

