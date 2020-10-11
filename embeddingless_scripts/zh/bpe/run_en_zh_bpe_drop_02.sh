#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en zh 14 0.2 1951
bash embeddingless_scripts/evaluate.sh bpe en zh 14 0.2 valid
bash embeddingless_scripts/score.sh bpe en zh 14 0.2 valid
