#!/bin/bash
PATH=~/.local/bin:$PATH
. ~/.profile
pip install gdown

mkdir -p dataset_files/ori_dataset
cd dataset_files
gdown 1_AckYkinAnhqmRQtGsQgUKAnTHxxX5J0
gdown 1yQ_mTwF4VzBB1_v5MB48odyXEGao2LrH
gdown 1XZHXCHiA3qYRsHjF68oo5gtzU_gbGMjo
gdown 1WlxXLFWpDSrCvCAIXDABSHQxIxXUdlp-

cd ..
unzip dataset_files/spider.zip -d dataset_files/ori_dataset/
unzip dataset_files/spider-dk.zip -d dataset_files/ori_dataset/
unzip dataset_files/spider-syn.zip -d dataset_files/ori_dataset/
unzip dataset_files/spider-realistic.zip -d dataset_files/ori_dataset/
chmod -R 777 dataset_files/
