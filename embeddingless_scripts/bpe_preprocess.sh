python fairseq_cli/preprocess.py --source-lang $1 --target-lang $2 \
    --trainpref examples/translation/iwslt$3.moses.bpe.$1-$2/train --validpref examples/translation/iwslt$3.moses.bpe.$1-$2/valid --testpref examples/translation/iwslt$3.moses.bpe.$1-$2/test \
    --destdir data-bin/moses-bpe-iwslt$3.$1-$2 \
    --workers 20 \
    --joined-dictionary