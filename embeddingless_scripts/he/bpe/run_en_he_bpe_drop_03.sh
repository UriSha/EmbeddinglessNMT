#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en he 14 0.3 1539
bash embeddingless_scripts/evaluate.sh bpe en he 14 0.3 valid
bash embeddingless_scripts/score.sh bpe en he 14 0.3 valid
