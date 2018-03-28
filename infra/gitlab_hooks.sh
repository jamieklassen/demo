if [ -z "$DOCKER_HOST" ]; then
  SWARM_HOST="localhost"
else
  SWARM_HOST=$(echo $DOCKER_HOST|sed 's;.*://\([^:]*\):\(.*\);\1;')
fi
GITLAB_HOST="$SWARM_HOST:10080"
curl $GITLAB_HOST/api/v4/projects/1/hooks \
  --data-urlencode "private_token=token" \
  --data-urlencode "url=http://jenkins:8080/project/app"
