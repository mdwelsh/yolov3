#!/bin/sh

python ./test.py \
  --task trace \
  --trace bricklens.pt \
  --batch-size 4 \
  --data data/bricklens_detection_2000_moreparts.yaml \
  --weights bricklens-yolov3/exp8/weights/best.pt 


