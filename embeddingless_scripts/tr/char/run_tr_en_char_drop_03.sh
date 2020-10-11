#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh tr en 14 0.3 7715
bash embeddingless_scripts/evaluate.sh char tr en 14 0.3 valid
bash embeddingless_scripts/score.sh char tr en 14 0.3 valid
