#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh en he 14 0.3 5722
bash embeddingless_scripts/evaluate.sh char en he 14 0.3 valid
bash embeddingless_scripts/score.sh char en he 14 0.3 valid
