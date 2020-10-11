#!/usr/bin/env bash
src=$1
tgt=$2
year=$3
cd examples/translation/
echo "======= Creating raw data for ${src}-${tgt} ======="
bash create_iwslt_data.sh $src $tgt $year
echo "======= Done creating raw data for ${src}-${tgt} ======="
echo "======= Creating raw data for ${tgt}-${src} ======="
bash create_iwslt_data.sh $tgt $src $year
echo "======= Done creating raw data for ${tgt}-${src} ======="
cd ../../
echo "======= Creating byte data for ${src}-${tgt} and ${tgt}-${src} ======="
bash embeddingless_scripts/byte_preprocess.sh $src $tgt $year
bash embeddingless_scripts/byte_preprocess.sh $tgt $src $year
echo "======= Byte data ready ======="
echo "======= Creating char data for ${src}-${tgt} and ${tgt}-${src} ======="
bash embeddingless_scripts/char_preprocess.sh $src $tgt $year
bash embeddingless_scripts/char_preprocess.sh $tgt $src $year
echo "======= Char data ready ======="
echo "======= Creating BPE data for ${src}-${tgt} and ${tgt}-${src} ======="
bash embeddingless_scripts/bpe_preprocess.sh $src $tgt $year
bash embeddingless_scripts/bpe_preprocess.sh $tgt $src $year
echo "======= BPE data ready ======="


