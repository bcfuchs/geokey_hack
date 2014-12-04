#!/usr/bin/env bash
set -e
source .env.gktwit
lat=$1;
lon=$2;
twitterid=$3;
twiturl=$4;



#get auth token
auth=`curl -s -H "Content-Type: application/x-www-form-urlencoded" -d "username=$GEOKEY_USERID;password=$GEOKEY_PASSWORD;client_id=$GEOKEY_ClientID;client_secret=$GEOKEY_ClientSecret;grant_type=password" $GEOKEY_SERVER/oauth2/access_token #| jq -r .access_token`
access_token=`echo $auth | jq -r .access_token`





function update_data {

    lon=$1;
    lat=$2;
    twitterid=$3;
    url=$4
    echo  $lat $lon id:$twitterid url:$url

    cat "$GKTWIT_HOME"/templates/add_data_t.txt |jq  ".geometry.coordinates[0] = $lat " | jq  ".geometry.coordinates[1] = $lon "| jq ".properties.category = $GEOKEY_CATEGORY_ID " |  jq  ".properties.attributes.twitterid = $twitterid " | jq -c ".properties.attributes.url = $url "  > "$GKTWIT_HOME"/data/add_data.txt;

};

function send_data  {

#TODO use a var instead of a file
 echo  $(curl -s -X POST -d @"$GKTWIT_HOME"/data/add_data.txt  -H  "Content-Type: application/json" -H "Authorization: Bearer $access_token" $GEOKEY_SERVER/api/projects/$GEOKEY_PROJECT_ID/contributions/)


}


update_data $lat $lon $twitterid $twiturl
send_data