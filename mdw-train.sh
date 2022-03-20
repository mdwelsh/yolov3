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

#python ./train.py \
#  --project bricklens-yolov3 \
#  --batch 4 \
#  --epochs 1000 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_8parts_10colors_2000images.yaml \
#  --hyp data/hyp.bricklens.yaml

# Starting run 8 Dec2021 with bricklens_8parts_10colors_10000images dataset.
# Note: Disabled augmentations in hyp.bricklens.yaml.


#python ./train.py \
#  --project bricklens-yolov3 \
#  --batch 4 \
#  --epochs 1000 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_8parts_10colors_10000images.yaml \
#  --hyp data/hyp.bricklens.yaml

# 17 March 2022: This is the model I have been using for app development.
# However, it seems to be too large to run on the phone.
#python ./train.py \
#  --project bricklens-yolov3 \
#  --batch 4 \
#  --epochs 100 \
#  --img-size 512 512 \
#  --cfg models/yolov3.yaml \
#  --data data/bricklens_8parts_nocolors_10000images.yaml \
#  --hyp data/hyp.bricklens.yaml

# 17 March 2022: Try a tiny model.
python ./train.py \
  --project bricklens-yolov3 \
  --batch 8 \
  --epochs 300 \
  --img-size 512 512 \
  --cfg models/yolov3-tiny.yaml \
  --data data/bricklens_8parts_nocolors_10000images.yaml \
  --hyp data/hyp.bricklens.yaml
