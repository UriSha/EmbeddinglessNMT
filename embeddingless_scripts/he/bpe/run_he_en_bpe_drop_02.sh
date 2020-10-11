#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh he en 14 0.2 1612
bash embeddingless_scripts/evaluate.sh bpe he en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe he en 14 0.2 valid
