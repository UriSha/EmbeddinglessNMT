#!/usr/bin/env bash
bash embeddingless_scripts/train_bpe.sh fa en 14 0.3 1378
bash embeddingless_scripts/evaluate.sh bpe fa en 14 0.3 valid
bash embeddingless_scripts/score.sh bpe fa en 14 0.3 valid
