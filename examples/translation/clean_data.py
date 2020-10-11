import argparse
import math

import os


def get_args_parser():
    parser = argparse.ArgumentParser()

    parser.add_argument('--src', metavar='N', type=str,
                        help='source language')
    parser.add_argument('--tgt', metavar='N', type=str,
                        help='targer language')
    parser.add_argument('--folder', metavar='N', type=str,
                        help='folder')
    parser.add_argument('--keep', metavar='N', type=float,
                        help='number of examples to keep')
    return parser.parse_args()


def write_cleaned_to_files(folder, src, tgt, cleaned_data):
    src_file_cleaned = f"train.tags.{src}-{tgt}.aligned.{src}"
    tgt_file_cleaned = f"train.tags.{src}-{tgt}.aligned.{tgt}"
    src_file_cleaned_path = os.path.join(folder, src_file_cleaned)
    tgt_file_cleaned_path = os.path.join(folder, tgt_file_cleaned)

    with open(src_file_cleaned_path, 'w', encoding='utf-8') as src_f_clean:
        with open(tgt_file_cleaned_path, 'w', encoding='utf-8') as tgt_f_clean:
            for item in cleaned_data:
                src_sent = item[1][2]
                tgt_sent = item[1][3]
                src_f_clean.write(src_sent)
                tgt_f_clean.write(tgt_sent)


def clean_data(src, tgt, folder, keep):
    src_file = f"train.tags.{src}-{tgt}.clean.{src}"
    tgt_file = f"train.tags.{src}-{tgt}.clean.{tgt}"

    src_file_path = os.path.join(folder, src_file)
    tgt_file_path = os.path.join(folder, tgt_file)
    dic = {}
    with open(src_file_path, 'r', encoding='utf-8') as src_f:
        with open(tgt_file_path, 'r', encoding='utf-8') as tgt_f:
            for i, (src_line, tgt_line) in enumerate(zip(src_f, tgt_f)):
                src_line_as_bytes = list(map(str, src_line.strip().encode('utf-8')))
                tgt_line_as_bytes = list(map(str, tgt_line.strip().encode('utf-8')))

                if len(src_line_as_bytes) == 0 or len(tgt_line_as_bytes) == 0:
                    dic[i] = (float('inf'), i, src_line, tgt_line)
                    continue

                src_ratio = float(len(src_line_as_bytes)) / len(tgt_line_as_bytes)
                tgt_ratio = float(len(tgt_line_as_bytes)) / len(src_line_as_bytes)

                ratio = max(src_ratio, tgt_ratio)

                dic[i] = (ratio, i, src_line, tgt_line)

    as_lst = sorted(dic.items(), key=lambda t: t[1][0], reverse=True)
    keep = math.ceil(keep)
    remove_index = len(as_lst) - keep
    as_lst = as_lst[remove_index:]
    as_lst = sorted(as_lst, key=lambda t: t[1][1])

    return sorted(as_lst, key=lambda t: t[1][1])


def clean_main():
    args = get_args_parser()
    src = args.src
    tgt = args.tgt
    folder = args.folder
    keep = args.keep
    cleaned_data = clean_data(src, tgt, folder, keep)
    write_cleaned_to_files(folder, src, tgt, cleaned_data)


if __name__ == '__main__':
    clean_main()
