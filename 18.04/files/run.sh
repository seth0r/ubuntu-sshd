#!/bin/bash
for f in passwd shadow; do
    if [ ! -f /config/$f ]; then
        cp /etc/$f.init /config/$f
    fi
    if [ ! -L /etc/$f ]; then
        rm /etc/$f
        ln -s /config/$f /etc/$f
    fi
done

/usr/sbin/sshd -D
