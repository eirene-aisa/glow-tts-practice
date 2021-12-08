config=$1
modeldir=$2

python -u init_custom_multi.py -c $config -m $modeldir
python -u train_custom_multi.py -c $config -m $modeldir