#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en vi 15 0.3 1544
bash embeddingless_scripts/evaluate.sh bpe en vi 15 0.3 valid
bash embeddingless_scripts/score.sh bpe en vi 15 0.3 valid
