#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en ar 14 0.2 5247
bash embeddingless_scripts/evaluate.sh char en ar 14 0.2 valid
bash embeddingless_scripts/score.sh char en ar 14 0.2 valid
