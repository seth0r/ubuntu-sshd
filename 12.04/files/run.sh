#!/bin/bash
if [ ! -f /etc/passwd ]; then
    cp -av /etc.init/* /etc/
fi
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
