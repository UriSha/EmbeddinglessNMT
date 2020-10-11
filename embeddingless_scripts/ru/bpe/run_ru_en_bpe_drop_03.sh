#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh ru en 14 0.3 1298
bash embeddingless_scripts/evaluate.sh bpe ru en 14 0.3 valid
bash embeddingless_scripts/score.sh bpe ru en 14 0.3 valid
