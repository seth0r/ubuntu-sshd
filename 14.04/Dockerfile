FROM       ubuntu:14.04
MAINTAINER Seth0r "https://github.com/seth0r"

RUN apt-get update
RUN apt-get dist-upgrade -y

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir /init
RUN cp -avl /etc /init/etc
RUN cp -avl /var /init/var
RUN cp -avl /root /init/root

COPY files/run.sh /usr/local/sbin/run.sh
RUN chmod +x /usr/local/sbin/run.sh

EXPOSE 22

CMD    ["/usr/local/sbin/run.sh"]
