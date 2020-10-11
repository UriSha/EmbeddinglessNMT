#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en es 14 0.3 7892
bash embeddingless_scripts/evaluate.sh char en es 14 0.3 valid
bash embeddingless_scripts/score.sh char en es 14 0.3 valid
