#!/bin/sh

# For MSCOCO:

#python ./train.py \
#  --batch 4 \
#  --cfg models/yolov3.yaml \
#  --data data/coco.yaml \
#  --hyp data/hyp.scratch.yaml

# For Bricklens:

#python ./train.py \
#  --batch 4 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_detection_1000.yaml \
#  --hyp data/hyp.scratch.yaml

#python ./train.py \
#  --batch 4 \
#  --epochs 1000 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_1000.yaml \
#  --hyp data/hyp.bricklens.yaml

# Starting run 14 Nov 2021 with new 2000-image dataset.

#python ./train.py \
#  --project bricklens-yolov3 \
#  --batch 4 \
#  --epochs 1000 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_detection_2000.yaml \
#  --hyp data/hyp.bricklens.yaml


# Starting run 24 Nov 2021 with new 2000-image-moreparts dataset.

#python ./train.py \
#  --project bricklens-yolov3 \
#  --batch 4 \
#  --epochs 1000 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_detection_2000_moreparts.yaml \
#  --hyp data/hyp.bricklens.yaml

# Starting run 29 Nov 2021 with bricklens_34parts_10colors_2000images dataset.

python ./train.py \
  --project bricklens-yolov3 \
  --batch 4 \
  --epochs 500 \
  --cfg models/yolov3.yaml \
  --data data/bricklens_34parts_10colors_2000images.yaml \
  --hyp data/hyp.bricklens.yaml
