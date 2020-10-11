#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh en ru 14 0.2 1251
bash embeddingless_scripts/evaluate.sh bpe en ru 14 0.2 valid
bash embeddingless_scripts/score.sh bpe en ru 14 0.2 valid
