#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

#python ./detect.py \
#  --source $HOME/datasets/mscoco/val2017 \
#  --weights runs/train/exp5/weights/best.pt

#python ./detect.py \
#  --source $HOME/src/bricklens/python/detection_1000/images \
#  --weights runs/train/exp5/weights/best.pt

python ./detect.py \
  --source /home/mdw/datasets/bricklens_detection_1000/test_images \
  --weights runs/train/exp7/weights/best.pt
