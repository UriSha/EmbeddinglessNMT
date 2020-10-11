#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en de 14 0.2 1944
bash embeddingless_scripts/evaluate.sh bpe en de 14 0.2 valid
bash embeddingless_scripts/score.sh bpe en de 14 0.2 valid
