#!/usr/bin/env bash

# Pulls down the latest changes from github before attempting an upload


STR=`id`
SUB='thomsope'
if [[ "$STR" == *"$SUB"* ]]; then
    export https_proxy=PITC-Zscaler-EMEA-London3PR.proxy.corporate.ge.com:80
fi

cd ~/.vim
git pull
git add .
git commit -m "$1"
git push
cd -
