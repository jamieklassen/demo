#!/bin/bash
repo=$1
git -C ../$repo init
git -C ../$repo add .
git -C ../$repo ci -m 'initial commit'
git -C ../$repo remote add origin http://username:password@localhost:10080/username/$repo.git
sleep 4
git -C ../$repo push origin master
rm -rf $../$repo/.git
