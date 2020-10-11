#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh ar en 14 0.3 5721
bash embeddingless_scripts/evaluate.sh char ar en 14 0.3 valid
bash embeddingless_scripts/score.sh char ar en 14 0.3 valid
