#!/usr/bin/env bash
bash embeddingless_scripts/train_byte_embeddingless.sh tr en 14 0.2 8000
bash embeddingless_scripts/evaluate.sh byte_embeddingless tr en 14 0.2 valid
bash embeddingless_scripts/score.sh byte_embeddingless tr en 14 0.2 valid
