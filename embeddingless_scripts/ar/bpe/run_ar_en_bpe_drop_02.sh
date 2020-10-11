#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh ar en 14 0.2 1513
bash embeddingless_scripts/evaluate.sh bpe ar en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe ar en 14 0.2 valid
