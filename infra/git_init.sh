#!/bin/bash
# wait for gogs to be up
false
while [ "$?" != "0" ]; do
  sleep 1
  curl -f localhost:10080
done
repo=$1
git -C ../$repo init
git -C ../$repo add .
git -C ../$repo ci -m 'initial commit'
git -C ../$repo remote add origin http://username:password@localhost:10080/username/$repo.git
sleep 4
git -C ../$repo push origin master
rm -rf $../$repo/.git
