#!/bin/bash
# This script is used for unsupervised training, inference and 
# benchmarking the PSPNet with SegSort on PASCAL VOC 2012.
#
# Usage:
#   # From SegSort/ directory.
#   bash bashscripts/voc12/train_segsort_unsup.sh


# Set up parameters for training.
BATCH_SIZE=8
TRAIN_INPUT_SIZE=336,336
WEIGHT_DECAY=5e-4
ITER_SIZE=1
NUM_STEPS=10000
NUM_CLASSES=21
LEARNING_RATE=2e-3

# Set up parameters for inference.
INFERENCE_INPUT_SIZE=480,480
INFERENCE_STRIDES=320,320
INFERENCE_SPLIT=val

# Set up SegSort hyper-parameters.
CONCENTRATION=10
EMBEDDING_DIM=32
NUM_CLUSTERS=5
KMEANS_ITERATIONS=10
K_IN_NEAREST_NEIGHBORS=15

# Set up path for saving models.
SNAPSHOT_DIR=snapshots/voc12/unsup_segsort/unsup_segsort_lr2e-3_it10k

# Set up the procedure pipeline.
IS_TRAIN=0
IS_PROTOTYPE=0
IS_INFERENCE_MSC=0
IS_BENCHMARK=1

# Update PYTHONPATH.
export PYTHONPATH=`pwd`:$PYTHONPATH

# Set up the data directory.
DATAROOT=/home/dz/SegSort/dataset/

# Train.
if [ ${IS_TRAIN} -eq 1 ]; then
  python main.py\
   DATAPATH \
   --arch resnet50\
   --resume input_model.pth.tar\
   -b 256\
   -e
fi
