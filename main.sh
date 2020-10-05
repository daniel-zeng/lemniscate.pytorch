#!/bin/bash


# Set up hyperparams
ARCH=resnet50
BATCH_SIZE=256
NUM_DATA_WORKER=4

# Update PYTHONPATH.
export PYTHONPATH=`pwd`:$PYTHONPATH

# Set up the data directory.
DATAROOT=/home/public/public_dataset/ILSVRC2014/Img
RESUME=lemniscate_resnet50.pth

IS_TRAIN=1

# Run.
if [ ${IS_TRAIN} -eq 1 ]; then
  python3 main.py\
   ${DATAROOT} \
   --arch ${ARCH}\
   --resume ${RESUME}\
   -j ${NUM_DATA_WORKER}\
   -b ${BATCH_SIZE}\
   -e
fi
