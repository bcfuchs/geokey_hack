#!/usr/bin/env bash
set -e
source .env.gktwit
cons_key=$TWITTER_CONSUMER_KEY
cons_secret=$TWITTER_CONSUMER_SECRET
cons_comb=$cons_key:$cons_secret 
authstring=`/bin/echo -n $cons_comb | base64 `;

access_token=`curl  --cacert ../certs/Class-3-Public-Primary-Certification-Authority-G2.pem \
 -X POST \
-H 'Content-Type: application/x-www-form-urlencoded;charset=UTF-8' \
-H "Authorization: Basic $authstring" \
--data 'grant_type=client_credentials' \
https://api.twitter.com/oauth2/token `
echo $access_token