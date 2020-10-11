#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en ar 14 0.2 1450
bash embeddingless_scripts/evaluate.sh bpe en ar 14 0.2 valid
bash embeddingless_scripts/score.sh bpe en ar 14 0.2 valid
