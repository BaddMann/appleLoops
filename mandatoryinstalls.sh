#!/bin/sh

#Find All Madatory Installs, Install
for MANDA in $(find /tmp/appleLoops -type d -name mandatory -mindepth 2 -maxdepth 5); do
    for PKG in $(ls "$MANDA" | grep "pkg$"); do
      echo "$MANDA/$PKG"
      /usr/sbin/installer -pkg "$MANDA/$PKG" -tgt / -allowUntrusted
    done
done

