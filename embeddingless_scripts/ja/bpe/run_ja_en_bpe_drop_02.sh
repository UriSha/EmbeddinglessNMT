#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh ja en 17 0.2 1761
bash embeddingless_scripts/evaluate.sh bpe ja en 17 0.2 valid
bash embeddingless_scripts/score.sh bpe ja en 17 0.2 valid
