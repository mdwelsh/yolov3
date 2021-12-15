#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

#python ./detect.py \
#  --source $HOME/datasets/bricklens/test_images \
#  --weights bricklens-yolov3/exp22/weights/best.pt \
#  --device cpu 

python ./detect.py \
  --source $HOME/datasets/bricklens/test_images \
  --weights bricklens-yolov3/exp24/weights/best.pt \
  --device cpu 

