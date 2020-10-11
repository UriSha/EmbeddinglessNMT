#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh tr en 14 0.2 1944
bash embeddingless_scripts/evaluate.sh bpe tr en 14 0.2 valid
bash embeddingless_scripts/score.sh bpe tr en 14 0.2 valid
