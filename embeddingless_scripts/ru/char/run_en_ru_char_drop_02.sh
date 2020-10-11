#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en ru 14 0.2 4642
bash embeddingless_scripts/evaluate.sh char en ru 14 0.2 valid
bash embeddingless_scripts/score.sh char en ru 14 0.2 valid
