#!/usr/bin/env bash
bash embeddingless_scripts/train_byte.sh es en 14 0.3 8000
bash embeddingless_scripts/evaluate.sh byte es en 14 0.3 valid
bash embeddingless_scripts/score.sh byte es en 14 0.3 valid
