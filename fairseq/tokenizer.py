# Copyright (c) Facebook, Inc. and its affiliates.
#
# This source code is licensed under the MIT license found in the
# LICENSE file in the root directory of this source tree.

import re


class Tokenizer:
    def __init__(self, args):
        assert not (args.byte_tokens and args.char_tokens), 'Cannot have both byte and char tokens at the same time.'
        if args.byte_tokens:
            self.tokenize_line = self.tokenize_bytes
            self.detokenize_line = self.detokenize_bytes
        elif args.char_tokens:
            self.tokenize_line = self.tokenize_chars
            self.detokenize_line = self.detokenize_chars
        else:
            self.space_normalizer = re.compile(r"\s+")
            self.tokenize_line = self.tokenize_words
            self.detokenize_line = self.detokenize_words

    def tokenize_bytes(self, line):
        return list(map(str, line.strip().encode('utf-8')))

    def tokenize_chars(self, line):
        return list(line.strip())

    def tokenize_words(self, line):
        line = self.space_normalizer.sub(" ", line)
        line = line.strip()
        return line.split()

    def detokenize_bytes(self, tokens):
        tokens = [t if (t != '<unk>' and t != '<<unk>>') else '32' for t in tokens]
        return bytes(map(int, tokens)).decode('utf-8', 'ignore')

    def detokenize_chars(self, tokens):
        return ''.join(tokens)

    def detokenize_words(self, tokens):
        return ' '.join(tokens)

    tokenizer = None

    @classmethod
    def build_tokenizer(cls, args):
        cls.tokenizer = cls(args)


def tokenize_line(line):
    return Tokenizer.tokenizer.tokenize_line(line)


def detokenize_line(tokens):
    return Tokenizer.tokenizer.detokenize_line(tokens)
