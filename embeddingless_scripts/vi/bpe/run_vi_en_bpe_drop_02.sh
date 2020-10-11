#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh vi en 15 0.2 1648
bash embeddingless_scripts/evaluate.sh bpe vi en 15 0.2 valid
bash embeddingless_scripts/score.sh bpe vi en 15 0.2 valid
