#!/usr/bin/env bash
set -e

hashtag=$1
trap "echo 'FAILED!'" EXIT

# sh geokey-tweet-app.sh $hastag
# get some tweets
# look for the ones with correct hashtags. 
# currently just the curl from twitter. 
# TODO--only look at direct messages.

tweets=`bash gettweets.sh $hashtag`

# filter if nec
# check seen list for tweets
# remove tweets already seen. 


tweets=`echo $tweets | jq -c ' .statuses[] | select(.entities.hashtags[].text | contains("'$hashtag'")) |{ "geo":.geo,"url":.entities.media[0].url,"id":.id } '`

for LINE in $tweets ; do

    lat=$(echo $LINE | jq .geo.coordinates[0])
    lon=$(echo $LINE | jq .geo.coordinates[1])
    url=$(echo $LINE | jq .url)
    twitid=$(echo $LINE | jq .id)


    set +e
    res= grep -q $twitid "$GKTWIT_HOME"/data/seen.txt 
    res=$?
    set -e

    if [ $res  -eq 1 ]; then 
	bash add2geokey.sh  $lat $lon $twitid  $url

# keep a list of ids and skip if you already have them 
	/bin/echo $twitid >> "$GKTWIT_HOME"/data/seen.txt
    fi


done;
trap "echo 'DONE!'" EXIT
exit 0;

