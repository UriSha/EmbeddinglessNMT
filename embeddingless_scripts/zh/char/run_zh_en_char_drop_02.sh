#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh zh en 14 0.2 7581
bash embeddingless_scripts/evaluate.sh char zh en 14 0.2 valid
bash embeddingless_scripts/score.sh char zh en 14 0.2 valid
