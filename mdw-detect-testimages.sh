#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

#python ./detect.py \
#  --source $HOME/datasets/bricklens/test_images \
#  --weights $HOME/models/bricklens/exp24/weights/best.pt \
#  --device cpu 

python ./detect.py \
  --source $HOME/datasets/bricklens/test_images_640 \
  --weights $HOME/models/bricklens/exp24/weights/best.pt \
  --torchscript bricklens_lite.ptl \
  --conf-thres=0.7 \
  --device cpu 
