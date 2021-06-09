#!/usr/bin/env bash
#
# Adapted from https://github.com/facebookresearch/MIXER/blob/master/prepareData.sh
#echo 'Cloning Moses github repository (for tokenization scripts)...'
#git clone https://github.com/moses-smt/mosesdecoder.git

src=$1
tgt=$2
year=$3
SCRIPTS=mosesdecoder/scripts
CLEAN=$SCRIPTS/training/clean-corpus-n.perl
GZ=${src}-${tgt}.tgz

lang=${src}-${tgt}
prep=iwslt${year}.${src}-${tgt}
tmp=$prep/tmp
orig=orig

mkdir -p $orig $tmp $prep

cd $orig

if [ -f $GZ ]; then
    echo "unzipping ${GZ}"
else
    echo "======================================================================================"
    echo "======================================================================================"
    echo "===================== Error! Data file ${GZ} is missing ======================"
    echo "======================================================================================"
    echo "======================================================================================"
    echo "===================== Hit ctrl+C to cancel this run and delete created files ======================"
    exit
fi

tar zxvf $GZ
cd ..

echo "pre-processing train data..."
for l in $src $tgt; do
    f=train.tags.$lang.$l

    cat $orig/$lang/$f | \
    grep -v '<url>' | \
    grep -v '<talkid>' | \
    grep -v '<keywords>' | \
    sed -e 's/<title>//g' | \
    sed -e 's/<\/title>//g' | \
    sed -e 's/<description>//g' | \
    sed -e 's/<\/description>//g' > $tmp/$f
    echo ""
done
orig_len=$(wc -l < $tmp/train.tags.$lang.$src)
keep_len=$(bc <<< "scale=3; 0.95*$orig_len")
echo "Original src data had ${orig_len} examples"
perl $CLEAN -ratio 9999999 $tmp/train.tags.$lang $src $tgt $tmp/train.tags.$lang.clean 1 800
new_len=$(wc -l < $tmp/train.tags.$lang.clean.$src | bc)
precentage_left=$(bc <<< "scale=3; ($new_len)/$orig_len")
precentage_removed=$(bc <<< "1-$precentage_left")
echo "Percentage of sentences removed by length filer ${precentage_removed}"
rm $tmp/train.tags.$lang.$src $tmp/train.tags.$lang.$tgt


python clean_data.py --src $src --tgt $tgt --folder $tmp --keep $keep_len
final_len=$(wc -l < $tmp/train.tags.$lang.aligned.$src | bc)
echo "Cleaned data has ${final_len} examples"
precentage_left=$(bc <<< "scale=3; ($final_len)/$orig_len")
precentage_removed=$(bc <<< "1-$precentage_left")
echo "Total percentage of sentences removed by cleaning ${precentage_removed}"
rm $tmp/train.tags.$lang.clean.$src $tmp/train.tags.$lang.clean.$tgt
mv $tmp/train.tags.$lang.aligned.$src $tmp/train.tags.$lang.$src
mv $tmp/train.tags.$lang.aligned.$tgt $tmp/train.tags.$lang.$tgt


echo "pre-processing valid/test data..."
for l in $src $tgt; do
    for o in `ls $orig/$lang/IWSLT${year}.TED.*.$l.xml`; do
    fname=${o##*/}
    f=$tmp/${fname%.*}
    echo $o $f
    grep '<seg id' $o | \
        sed -e 's/<seg id="[0-9]*">\s*//g' | \
        sed -e 's/\s*<\/seg>\s*//g' | \
        sed -e "s/\’/\'/g" > $f
    echo ""
    done
done

echo "creating train, valid, test..."
for l in $src $tgt; do
    awk '{if (NR%23 == 0)  print $0; }' $tmp/train.tags.$lang.$l > $prep/valid.$l
    awk '{if (NR%23 != 0)  print $0; }' $tmp/train.tags.$lang.$l > $prep/train.$l

    rm $prep/test.$l
    for f in `ls $tmp/IWSLT${year}.TED.*.$l`; do
        cat $f >> $prep/test.$l
    done
done
