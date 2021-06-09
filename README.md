Implementation of [Neural Machine Translation without Embeddings](https://arxiv.org/abs/2008.09396).

## Requirements

* [PyTorch](http://pytorch.org/) version >= 1.4.0
* Python version >= 3.6
* NVIDIA GPU and [NCCL](https://github.com/NVIDIA/nccl)

## Getting started
```bash
git clone https://github.com/pytorch/EmbeddinglessNMT
cd EmbeddinglessNMT
pip install --editable ./
mkdir results
cd examples/translation
git clone https://github.com/moses-smt/mosesdecoder.git
git clone https://github.com/rsennrich/subword-nmt.git
cd ../..
```
**Edit examples/translation/mosesdecoder/scripts/training/clean-corpus-n.perl to run on bytes**:

From:
```bash
sub word_count {
 my ($line) = @_;
 if ($ignore_xml) {
  $line =~ s/<\S[^>]*\S>/ /g;
  $line =~ s/\s+/ /g;
  $line =~ s/^ //g;
  $line =~ s/ $//g;
 }
 my @w = split(/ /,$line);
 return scalar @w;
}
```
To:
```bash
sub word_count {
 use bytes;
 my ($line) = @_;
 if ($ignore_xml) {
  $line =~ s/<\S[^>]*\S>/ /g;
  $line =~ s/\s+/ /g;
  $line =~ s/^ //g;
  $line =~ s/ $//g;
 }
 return length($line);
}
```
## Prepare data:
* Download data from:
    * https://wit3.fbk.eu/2014-01 for Chinese, Spanish, Arabic, Russian, German, Turkish, Farsi and Hebrew.
    * https://wit3.fbk.eu/2015-01 for Vietnamese.
    * https://wit3.fbk.eu/2017-01-c for Japanese.
    
* Find the .tgz files of a language pair in the "texts" folder, e.g. texts/zh/en and texts/en/zh for Chinese.
* Create a folder named "orig" in EmbeddinglessNMT/examples/translation/ and place the en-xx.tgz and xx-en.tgz files in it.
```bash
bash embeddingless_scripts/de/prepare-de-data.sh # this preprocess data for all de-en and en-de models 
```
## Train and evaluate:
```bash
export CUDA_VISIBLE_DEVICES=0
# the following scripts will train different baseline and embeddingless models on de-en data using dropout=0.2 and evaluate them on the validation set
bash embeddingless_scripts/de/byte/run_de_en_byte_drop_02.sh 
bash embeddingless_scripts/de/byte_embeddingless/run_de_en_byte_embeddingless_drop_02.sh 
bash embeddingless_scripts/de/char/run_de_en_char_drop_02.sh 
bash embeddingless_scripts/de/bpe/run_de_en_bpe_drop_02.sh
```
Please evaluate a byte model before evaluating bpe, char or embeddingless models for any language pair.

For faster training with 8 GPUs please set --update-freq value to 1 instead of 8 in the training scripts:
* embeddingless_scripts/train_bpe.sh
* embeddingless_scripts/train_char.sh
* embeddingless_scripts/train_byte.sh
* embeddingless_scripts/train_byte_embeddingless.sh

## License

EmbeddinglessNMT is MIT-licensed.
