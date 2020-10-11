#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh de en 14 0.2 7897
bash embeddingless_scripts/evaluate.sh char de en 14 0.2 valid
bash embeddingless_scripts/score.sh char de en 14 0.2 valid
