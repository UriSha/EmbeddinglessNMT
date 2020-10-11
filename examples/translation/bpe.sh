#!/usr/bin/env bash
# Adapted from https://github.com/facebookresearch/MIXER/blob/master/prepareData.sh
BPEROOT=subword-nmt/subword_nmt
src=$1
tgt=$2
lang=${src}-${tgt}
inpath=$3
outpath=$4
num_bpe_tokens=10000

mkdir -p $outpath
TRAIN=$outpath/train.en-de
rm -f $TRAIN
for l in $src $tgt; do
    cat $inpath/train.$l >> $TRAIN
done
BPE_CODE=$outpath/code
python $BPEROOT/learn_bpe.py -s $num_bpe_tokens < $TRAIN > $BPE_CODE
rm -f $TRAIN
for L in $src $tgt; do
    for f in train.$L valid.$L test.$L; do
        python $BPEROOT/apply_bpe.py -c $BPE_CODE < $inpath/$f > $outpath/$f
    done
done
