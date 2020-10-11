#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh es en 14 0.2 7892
bash embeddingless_scripts/evaluate.sh char es en 14 0.2 valid
bash embeddingless_scripts/score.sh char es en 14 0.2 valid
