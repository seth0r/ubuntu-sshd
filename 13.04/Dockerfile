FROM       ubuntu:13.04
MAINTAINER Seth0r "https://github.com/seth0r"

RUN apt-get update

RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

RUN echo 'root:root' |chpasswd

RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mv /etc/passwd /config/passwd ; ln -s /config/passwd /etc/passwd
RUN mv /etc/shadow /config/shadow ; ln -s /config/shadow /etc/shadow

VOLUME ["/config"]

EXPOSE 22

CMD    ["/usr/sbin/sshd", "-D"]
