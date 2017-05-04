#!/bin/sh

#Find All Madatory Installs, Install
for MANDA in $(find /tmp/appleLoops -type d -name mandatory -mindepth 2 -maxdepth 5); do
    for PKG in $(ls "$MANDA" | grep "pkg$"); do
      echo "Installing: $PKG"
      installlog=$(/usr/sbin/installer -pkg "$MANDA/$PKG" -tgt / -allowUntrusted)
      echo $installlog >> /tmp/appleLoops/mandatedinstalls.log
    done
done

cat /tmp/appleLoops/mandatedinstalls.log | tail # For JSS Logs

exit 0