#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh ru en 14 0.3 4896
bash embeddingless_scripts/evaluate.sh char ru en 14 0.3 valid
bash embeddingless_scripts/score.sh char ru en 14 0.3 valid
