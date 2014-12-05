#!/usr/bin/env bash
set -e
source .env.gktwit
hashtag=$1;

access_token=`bash get_auth.sh | jq -r .access_token`;
base=https://api.twitter.com

path="/1.1/search/tweets.json?count=50&screen_name=$TWITTER_SCREEN_NAME&q=$hashtag"
url=$base$path

echo `curl  --cacert "$GKTWIT_HOME"/certs/Class-3-Public-Primary-Certification-Authority-G2.pem \
-s  \
-H "Authorization: Bearer $access_token" \
$url `


