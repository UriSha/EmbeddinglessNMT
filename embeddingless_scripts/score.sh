#!/usr/bin/env bash
data=$1
src=$2
tgt=$3
year=$4
dropout=$5
gen_subset=$6
model=${data}_${src}_${tgt}_${year}_${dropout}
checkpoint="avg_50k"

baseline="byte_${src}_${tgt}_${year}_${dropout}"
ref_file="results/${baseline}/${gen_subset}/${checkpoint}.ref"
hyp_file="results/${model}/${gen_subset}/${checkpoint}.hyp"
scores_file="results/${model}/${gen_subset}/${checkpoint}.scores"


echo "model is ${model}"
echo "gen_subset ${gen_subset}"
echo "checkpoint ${checkpoint}"
echo "ref_file is ${ref_file}"
echo "hyp_file is ${hyp_file}"
echo "scores_file is ${scores_file}"

rm ${scores_file}
sacrebleu ${ref_file} --metrics bleu --tokenize 13a < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics bleu --tokenize intl < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics bleu --tokenize zh < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics bleu --tokenize none < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-order 6 < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-whitespace --chrf-order 6 < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-order 9 < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-whitespace --chrf-order 9 < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-order 12 < ${hyp_file} >> ${scores_file}
sacrebleu ${ref_file} --metrics chrf --tokenize none --chrf-whitespace --chrf-order 12 < ${hyp_file} >> ${scores_file}

cat ${scores_file}