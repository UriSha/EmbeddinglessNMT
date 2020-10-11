#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh vi en 15 0.3 6554
bash embeddingless_scripts/evaluate.sh char vi en 15 0.3 valid
bash embeddingless_scripts/score.sh char vi en 15 0.3 valid
