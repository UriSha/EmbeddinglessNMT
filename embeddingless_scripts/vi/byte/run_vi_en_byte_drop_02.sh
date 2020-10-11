#!/usr/bin/env bash
bash embeddingless_scripts/train_byte.sh vi en 15 0.2 8000
bash embeddingless_scripts/evaluate.sh byte vi en 15 0.2 valid
bash embeddingless_scripts/score.sh byte vi en 15 0.2 valid
