#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en ja 17 0.3 1672
bash embeddingless_scripts/evaluate.sh bpe en ja 17 0.3 valid
bash embeddingless_scripts/score.sh bpe en ja 17 0.3 valid
