#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh he en 14 0.3 6285
bash embeddingless_scripts/evaluate.sh char he en 14 0.3 valid
bash embeddingless_scripts/score.sh char he en 14 0.3 valid
