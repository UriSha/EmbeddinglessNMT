#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en es 14 0.3 1978
bash embeddingless_scripts/evaluate.sh bpe en es 14 0.3 valid
bash embeddingless_scripts/score.sh bpe en es 14 0.3 valid
