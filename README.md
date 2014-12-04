geokey_hack
===========

Geokey twitter input application 

This is the code from my contribution to the GeoKey code sprint—an application for geokey that lets you turn twitter into a data collection tool for geokey. 

The application needs to be set up on a server and run as a cronjob. It will harvest a twitter stream, extract tweets with a given hashtag that have been sent to your account, and add them (including an image if present) to your GeoKey project

The code is a proof-of-concept written in a day, so a) no error-checking , b) no guarantees. 

#Set up

##1. Set up your GeoKey Project

Define a project and a data category. 

##2. Create a GeoKey pplication

##3. Create an Twitter application 

Create an application for the twitter account you want to use as the mailbox for data. 

##4. Set up your .env.gktwit

-Copy bin/env.sample to bin/.env.gktwit
-Open bin/.env.gktwit in an editor
-Supply required info--further instructions in the file. 


##5. Set up a cron job to run c. every 15 mins
where HASHTAG is the hashtag that 

e.g.  */4 *  * * * cd /path/to/this/app; /bin/bash bin/geokey-tweet-app.sh HASHTAG >& /dev/nul 



