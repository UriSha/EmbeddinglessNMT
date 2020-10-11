#!/usr/bin/env bash
src=$1
tgt=$2
year=$3

echo "Running prepare-iwslt-raw.sh.."
bash prepare-iwslt-raw.sh $src $tgt $year
echo "Done prepare data, saved to iwslt$year.$src-$tgt"
echo "moses tokenizing.."
bash moses.sh $src $tgt iwslt$year.$src-$tgt iwslt$year.moses.$src-$tgt
echo "Done moses tokenizing, saved to iwslt$year.moses.$src-$tgt"
echo "learning bpe.."
bash bpe.sh $src $tgt iwslt$year.moses.$src-$tgt iwslt$year.moses.bpe.$src-$tgt
echo "Done bpe, saved to iwslt$year.moses.bpe.$src-$tgt"