#!/bin/bash
if [ ! -f /etc/passwd ]; then
    cp -av /etc.init/* /etc/
fi
apt-get update
apt-get dist-upgrade -y
if [ -f /etc/apt.install ]; then
    cat /etc/apt.install | while read p; do
        apt-get install -y "$p"
    done
fi
if [ -f /etc/apt.remove ]; then
    cat /etc/apt.remove | while read p; do
        apt-get remove -y "$p"
    done
fi
apt-get autoremove -y
if [ -f /etc/run.sh ]; then
    bash /etc/run.sh
fi
/usr/sbin/sshd -D
