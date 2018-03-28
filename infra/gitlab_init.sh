#!/bin/bash
# wait for gitlab to be up
if [ -z "$DOCKER_HOST" ]; then
  GITLAB_HOST="localhost:10080"
else
  GITLAB_HOST="$(echo $DOCKER_HOST|sed 's;.*://\([^:]*\):\(.*\);\1;'):10080"
fi
false
while [ "$?" != "0" ]; do
  echo "waiting for git server..."
  sleep 1
  curl -f $GITLAB_HOST >/dev/null 2>&1
done
docker exec -it infra_gitlab_1 gitlab-rails r "token = PersonalAccessToken.new(user: User.where(id: 1).first, name: 'temp token', token: 'token', scopes: ['api', 'read_user', 'sudo']); token.save"'!'
workdir=$(dirname $0)
curl -XPOST $GITLAB_HOST/api/v4/user/keys \
  --data-urlencode "private_token=token" \
  --data-urlencode "title=jenkins_rsa" \
  --data-urlencode "key=$(cat $workdir/jenkins/jenkins_rsa.pub)"
