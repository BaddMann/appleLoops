#!/bin/sh

#Find All Optional Installs, Install
for Optional in $(find /tmp/appleLoops -type d -name optional -mindepth 2 -maxdepth 5); do
    for PKG in $(ls "$Optional" | grep "pkg$"); do
      echo "Installing: $PKG"
      installlog=$(/usr/sbin/installer -pkg "$Optional/$PKG" -tgt / -allowUntrusted)
      echo $installlog >> /tmp/appleLoops/optionalinstalls.log
    done
done

cat /tmp/appleLoops/optionalinstalls.log | tail # For JSS Logs

exit 0