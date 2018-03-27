SWARM_HOST=$(echo $DOCKER_HOST|sed 's;.*://\([^:]*\):\(.*\);\1;')
GITLAB_HOST="$SWARM_HOST:10080"
curl $GITLAB_HOST/api/v4/projects/1/hooks \
  --data-urlencode "private_token=token" \
  --data-urlencode "url=http://$SWARM_HOST:8085/project/app"
