#!/bin/sh

python ./test.py \
  --device cpu \
  --task trace \
  --trace bricklens.pt \
  --batch-size 4 \
  --img-size 512 \
  --data data/bricklens_8parts_nocolors_10000images.yaml \
  --weights bricklens-yolov3/exp24/weights/best.pt

