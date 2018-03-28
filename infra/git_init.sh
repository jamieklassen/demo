#!/bin/bash
if [ -z "$DOCKER_HOST" ]; then
  GITLAB_HOST="localhost:10080"
else
  GITLAB_HOST="$(echo $DOCKER_HOST|sed 's;.*://\([^:]*\):\(.*\);\1;'):10080"
fi
curl -XPOST "$GITLAB_HOST/api/v4/projects?name=$repo&private_token=token"
repo=$1
git -C $repo init
git -C $repo add .
git -C $repo ci -m 'initial commit'
git -C $repo remote add origin "http://oauth2:token@$GITLAB_HOST/root/$repo.git"
git -C $repo push origin master
rm -rf $repo/.git
