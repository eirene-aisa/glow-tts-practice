config=$1
modeldir=$2

python init_custom_multi.py -c $config -m $modeldir
python train_custom_multi.py -c $config -m $modeldir