#!/bin/bash
curl -XPOST "localhost:10080/api/v4/projects?name=$repo&private_token=token"
repo=$1
git -C $repo init
git -C $repo add .
git -C $repo ci -m 'initial commit'
git -C $repo remote add origin http://oauth2:token@localhost:10080/root/$repo.git
git -C $repo push origin master
rm -rf $repo/.git
