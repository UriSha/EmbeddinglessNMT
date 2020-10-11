#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh zh en 14 0.2 1951
bash embeddingless_scripts/evaluate.sh bpe zh en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe zh en 14 0.2 valid
