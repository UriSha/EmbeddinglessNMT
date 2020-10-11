#!/usr/bin/env bash
bash embeddingless_scripts/train_byte.sh en fa 14 0.2 8000
bash embeddingless_scripts/evaluate.sh byte en fa 14 0.2 valid
bash embeddingless_scripts/score.sh byte en fa 14 0.2 valid
