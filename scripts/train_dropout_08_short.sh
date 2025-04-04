#! /bin/bash

scripts=$(dirname "$0")
base=$(realpath $scripts/..)

models=$base/models
data=$base/data
tools=$base/tools

mkdir -p $models

num_threads=4
device=""

SECONDS=0

(cd $tools/pytorch-examples/word_language_model &&
    CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads $base/venvs/torch3/bin/python main.py --data $tools/pytorch-examples/word_language_model/data/wikitext-2 \
      --epochs 2 \
      --log-interval 100 \
      --emsize 200 --nhid 200 --dropout 0.8 --tied \
      --mps \
      --save $base/models_dropout/model_d08.pt




)

echo "time taken:"
echo "$SECONDS seconds"
