#!/usr/bin/env bash

# Adapted from https://github.com/facebookresearch/MIXER/blob/master/prepareData.sh
TOKENIZER=mosesdecoder/scripts/tokenizer/tokenizer.perl
src=$1
tgt=$2
lang=${src}-${tgt}
inpath=$3
outpath=$4
mkdir -p $outpath
for L in $src $tgt; do
    for f in train.$L valid.$L test.$L; do
        cat $inpath/$f | perl $TOKENIZER -threads 8 -l $L > $outpath/$f
    done
done