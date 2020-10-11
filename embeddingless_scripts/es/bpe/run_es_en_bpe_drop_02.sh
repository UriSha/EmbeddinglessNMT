#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh es en 14 0.2 1985
bash embeddingless_scripts/evaluate.sh bpe es en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe es en 14 0.2 valid
