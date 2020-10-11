#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh ja en 17 0.2 6764
bash embeddingless_scripts/evaluate.sh char ja en 17 0.2 valid
bash embeddingless_scripts/score.sh char ja en 17 0.2 valid
