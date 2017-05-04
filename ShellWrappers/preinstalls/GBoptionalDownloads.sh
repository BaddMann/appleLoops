#!/bin/sh
#TODO: make this script Suck Less.
CacheServer="http://replace.me:porthere" #Todo Support Parameters, JSS Specific.

cd /tmp
git clone https://github.com/BaddMann/appleLoops

##find correct permissions to lock down folder while installing
#chown root:root /tmp/appleLoops
#chmod -r 770 /tmp/appleLoops

cd /tmp/appleLoops
echo "Downloading 2016 Loops From Cache Server"
#Mandatory Download of GarageBand loops from Cache Server.
cachelog=$(python appleLoops.py --package-set garageband  --optional-only -c $CacheServer)
echo $cachelog > cachedownload.log
cat cachedownload.log | tail # For JSS Logs

echo "Downloading 2016 Loops From Original Server"
#Mandatory Download of GarageBand loops from Original Source... Just incase the above failed.
sourcelog=$(python appleLoops.py --package-set garageband --optional-only)
echo $sourcelog > sourcedownload.log

cat sourcedownload.log | tail # For JSS Logs

exit 0
