#!/usr/bin/env bash
data=$1
src=$2
tgt=$3
year=$4
dropout=$5
gen_subset=$6
model=${data}_${src}_${tgt}_${year}_${dropout}

if [[ ${data} == *"byte_embeddingless"* ]] ; then
    data="byte"
fi

tokenization="--${data}-tokens"
remove_bpe=""
if [[ ${data} == *"bpe"* ]] ; then
    data="moses-bpe"
    action="detok_moses"
    remove_bpe="--remove-bpe"
    tokenization=""
fi

dataset=${data}-iwslt${year}.${src}-${tgt}
bsz=16

echo "tokenization is for generate.py is ${tokenization}"
echo "remove-bpe is for generate.py is ${remove_bpe}"
echo "dataset is ${dataset}"
echo "model is ${model}"
echo "gen_subset ${gen_subset}"

bash embeddingless_scripts/avg_checkpoints.sh $model 50k
checkpoint="avg_50k"
gen_file="results/${model}/${gen_subset}/${checkpoint}.gen"
ref_file="results/${model}/${gen_subset}/${checkpoint}.ref"
hyp_file="results/${model}/${gen_subset}/${checkpoint}.hyp"
echo "gen_file ${gen_file}"
echo "ref_file ${ref_file}"
echo "hyp_file ${hyp_file}"

#mkdir results
mkdir results/${model}
mkdir results/${model}/${gen_subset}
python fairseq_cli/generate.py data-bin/${dataset} --path checkpoints/${model}/checkpoint_${checkpoint}.pt --batch-size ${bsz} --beam 5 ${tokenization} --gen-subset ${gen_subset} --sacrebleu ${remove_bpe} --max-len-a 0 --max-len-b 10000 --max-source-positions 10000 --max-target-positions 10000 > ${gen_file}

cat ${gen_file} | grep -P "^T" | sort -k 1,1 | cut -f 2 > ${ref_file}
cat ${gen_file} | grep -P "^H" | sort -k 1,1 | cut -f 3 > ${hyp_file}

if [[ ${action} == *"detok_moses"* ]] ; then
    echo "detokenizing moses.."
    moses_detokenizer="perl examples/translation/mosesdecoder/scripts/tokenizer/detokenizer.perl"
    $moses_detokenizer < ${ref_file} > ${ref_file}.detok ;
    mv ${ref_file}.detok ${ref_file}
    $moses_detokenizer < ${hyp_file} > ${hyp_file}.detok ;
    mv ${hyp_file}.detok ${hyp_file}
fi