#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en fa 14 0.2 4689
bash embeddingless_scripts/evaluate.sh char en fa 14 0.2 valid
bash embeddingless_scripts/score.sh char en fa 14 0.2 valid
