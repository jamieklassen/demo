#!/bin/bash
BASE_URL='http://hygieia-audit.cibcdevops.cicd.technology'
ENDPOINT='/dashboardReview'
PARAMS="title=dashboard"
END_DATE=$(echo $(date +'%s') '*' 1000 | bc -l)
BEGIN_DATE=$(echo $END_DATE - 5184000000 | bc -l)
PARAMS+="&beginDate=$BEGIN_DATE"
PARAMS+="&endDate=$END_DATE"
PARAMS+="&auditType=TEST_RESULT"
USER='administrator'
TOKEN='aKJ8V/dtDWIEFSleuc6Px1sZ44BUxwIa'
passwordIsAuthToken="PasswordIsAuthToken:{\"apiKey\":\"$TOKEN\"}"
encodedAuth=$(echo "$passwordIsAuthToken" | base64)
authHeader="apiToken $encodedAuth"
curl -s \
  -H "Authorization: $authHeader" \
  -H "apiUser: $USER" \
  "$BASE_URL$ENDPOINT?$PARAMS" | jq
