curl localhost:10080/api/v4/projects/1/hooks \
  --data-urlencode "private_token=token" \
  --data-urlencode "url=http://jenkins:8080/project/app"
