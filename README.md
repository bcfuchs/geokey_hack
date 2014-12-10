geokey_hack
===========

Geokey twitter input application 

This is the code from my contribution to the GeoKey code sprint—an application for geokey that lets you turn twitter on mobile devices  into an "instant" data collection tool for [GeoKey](http://geokey.org.uk/). 

The application needs to be set up on a server and run as a cronjob. It will harvest a twitter stream, extract tweets with a given hashtag that have been sent to your account, and add them (including geo data and an image if present) to your GeoKey project

The code is a proof-of-concept written in a day, so a) no error-checking , b) no guarantees. 

Note: you will need the excellent jq to run this, which you can get here: [http://stedolan.github.io/jq/](http://stedolan.github.io/jq/)

#Set up

##1. Set up your GeoKey Project

Define a project and a data category in Geokey. 

In the data category of your GeoKey project, define text fields for twitterid and url. These will be used to store the image from twitter and the tweet id. Make sure that they are not mandatory/required.

##2. Create a GeoKey application

Create an application in GeoKey. 

Make a note of the client id and client secret.

##3. Create a Twitter application 

Create an application for the twitter account you want to use as the mailbox for data. 

##4. Set up your .env.gktwit

Copy bin/env.sample to bin/.env.gktwit

Open bin/.env.gktwit in an editor

Supply required info--further instructions in the file. 


##5. Set up a cron job 

Set up a cron job to run c. every 15 mins
(where HASHTAG is the hashtag that data collectors will use in their tweets)

e.g.  */4 *  * * * cd /path/to/this/app/bin; /bin/bash geokey-tweet-app.sh HASHTAG >& /dev/null 

##6. Crowdsource

Let people know what hashtag and handle to use for contributions on twitter. 

Make sure contributors know to turn on "location" in the twitter app settings on their mobiles. 




