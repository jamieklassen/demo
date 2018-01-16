#!/bin/bash
tmpdir=/tmp/app
rm -rf $tmpdir
mkdir -p $tmpdir
git -C $tmpdir init
shopt -s dotglob
cp -r ../app/* $tmpdir/
shopt -u dotglob
git -C $tmpdir add $tmpdir
git -C $tmpdir ci -m 'initial commit'
git config receive.denyCurrentBranch updateInstead
GIT_DIR=$tmpdir docker-compose up -d
