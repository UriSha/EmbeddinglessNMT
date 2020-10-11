#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en de 14 0.2 7911
bash embeddingless_scripts/evaluate.sh char en de 14 0.2 valid
bash embeddingless_scripts/score.sh char en de 14 0.2 valid
