#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en ja 17 0.2 6222
bash embeddingless_scripts/evaluate.sh char en ja 17 0.2 valid
bash embeddingless_scripts/score.sh char en ja 17 0.2 valid
