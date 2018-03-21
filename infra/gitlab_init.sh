#!/bin/bash
# wait for gitlab to be up
false
while [ "$?" != "0" ]; do
  echo "waiting for git server..."
  sleep 1
  curl -f localhost:10080 >/dev/null 2>&1
done
docker exec -it infra_gitlab_1 gitlab-rails r "token = PersonalAccessToken.new(user: User.where(id: 1).first, name: 'temp token', token: 'token', scopes: ['api', 'read_user', 'sudo']); token.save"'!'
workdir=$(dirname $0)
curl -XPOST localhost:10080/api/v4/user/keys \
  --data-urlencode "private_token=token" \
  --data-urlencode "title=jenkins_rsa" \
  --data-urlencode "key=$(cat $workdir/jenkins/jenkins_rsa.pub)"
