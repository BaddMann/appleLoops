#!/bin/sh

#Find All Optional Installs, Install
for Optional in $(find /tmp/appleLoops -type d -name optional -mindepth 2 -maxdepth 5); do
    for PKG in $(ls "$Optional" | grep "pkg$"); do
      echo "$Optional/$PKG"
      /usr/sbin/installer -pkg "$Optional/$PKG" -tgt / -allowUntrusted
    done
done
