#!/bin/sh
branch=${1:-"master"}
if [ ! `git branch -a | grep "remotes/origin/$branch"` ]; then
    echo "No branch $branch."
    exit
fi
rm -rf content/*
rm -rf theme/*
git checkout -f $branch
git pull origin $branch
sh ./tools/init.sh
