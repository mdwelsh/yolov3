#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

#python ./detect.py \
#  --source $HOME/datasets/mscoco/val2017 \
#  --weights runs/train/exp5/weights/best.pt

#python ./detect.py \
#  --source $HOME/src/bricklens/python/detection_1000/images \
#  --weights runs/train/exp5/weights/best.pt

#python ./detect.py \
#  --source $HOME/datasets/bricklens_detection_2000/test_images \
#  --weights saved-runs/bricklens_detection_2000_works/weights/best.pt 

#python ./detect.py \
#  --source $HOME/datasets/bricklens_detection_2000_moreparts/test_images \
#  --weights saved-runs/bricklens_detection_2000_morepieces_works/weights/best.pt 

#python ./detect.py \
#  --source $HOME/datasets/bricklens/bricklens_8parts_10colors_2000images/test_images \
#  --weights bricklens-yolov3/exp15/weights/best.pt

python ./detect.py \
  --device cpu \
  --source $HOME/datasets/bricklens/bricklens_8parts_10colors_10000images/test_images \
  --weights bricklens-yolov3/exp20/weights/best.pt
