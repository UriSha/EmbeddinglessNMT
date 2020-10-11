#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en fa 14 0.3 1273
bash embeddingless_scripts/evaluate.sh bpe en fa 14 0.3 valid
bash embeddingless_scripts/score.sh bpe en fa 14 0.3 valid
