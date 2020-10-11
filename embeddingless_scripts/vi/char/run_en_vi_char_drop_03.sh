#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en vi 15 0.3 6126
bash embeddingless_scripts/evaluate.sh char en vi 15 0.3 valid
bash embeddingless_scripts/score.sh char en vi 15 0.3 valid
