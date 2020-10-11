#!/usr/bin/env bash
bash embeddingless_scripts/train_char.sh fa en 14 0.3 5100
bash embeddingless_scripts/evaluate.sh char fa en 14 0.3 valid
bash embeddingless_scripts/score.sh char fa en 14 0.3 valid
