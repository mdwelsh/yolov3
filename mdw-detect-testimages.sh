#!/bin/sh

# Use $HOME/venvs/yolov3/bin/activate

# The original 'large' model.
python ./detect.py \
  --source ./testimages \
  --weights ./bricklens-yolov3/exp24/weights/best.pt \
  --device cpu \
  --img-size 512

# The new 'tiny' model.
python ./detect.py \
  --source ./testimages \
  --weights ./bricklens-yolov3/exp30/weights/best.pt \
  --device cpu \
  --img-size 512

#python ./detect.py \
#  --source $HOME/datasets/bricklens/test_images_640 \
#  --weights $HOME/models/bricklens/exp24/weights/best.pt \
#  --torchscript bricklens_lite.ptl \
#  --conf-thres=0.7 \
#  --device cpu 
