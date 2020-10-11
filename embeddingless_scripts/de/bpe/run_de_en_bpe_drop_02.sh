#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh de en 14 0.2 1974
bash embeddingless_scripts/evaluate.sh bpe de en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe de en 14 0.2 valid
