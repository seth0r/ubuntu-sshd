#!/bin/bash
for f in passwd shadow group ssh; do
    if [ ! -f /config/$f.init ]; then
        cp -av /etc/$f /etc/$f.init
    fi
    if [ ! -f /config/$f ]; then
        cp -av /etc/$f.init /config/$f
    fi
    if [ ! -L /etc/$f ]; then
        rm -rf /etc/$f
        ln -s /config/$f /etc/$f
    fi
done
apt-get update
apt-get dist-upgrade -y
if [ -f /config/install ]; then
    cat /config/install | while read p; do
        apt-get install -y "$p"
    done
fi
if [ -f /config/remove ]; then
    cat /config/remove | while read p; do
        apt-get remove -y "$p"
    done
fi
apt-get autoremove -y
if [ -f /config/run.sh ]; then
    bash /config/run.sh
fi
/usr/sbin/sshd -D
