#!/bin/sh

python ./train.py \
  --batch 4 \
  --cfg models/yolov3.yaml \
  --data data/coco.yaml \
  --hyp data/hyp.scratch.yaml
