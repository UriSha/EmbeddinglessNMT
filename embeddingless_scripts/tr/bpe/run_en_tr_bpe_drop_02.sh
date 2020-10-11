#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en tr 14 0.2 1934
bash embeddingless_scripts/evaluate.sh bpe en tr 14 0.2 valid
bash embeddingless_scripts/score.sh bpe en tr 14 0.2 valid
