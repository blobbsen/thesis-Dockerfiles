FROM debian:jessie
MAINTAINER andre@blobb.me

ENV VERSION 1.635
ENV DOWNLOAD_LINK http://ftp.nluug.nl/programming/jenkins/debian

ENV SSH_PORT 22
ENV HTTP_PORT 8080
ENV HTTPS_PORT 4333
ENV JNLP_PORT 4242

EXPOSE $SSH_PORT
EXPOSE $JNLP_PORT
EXPOSE $HTTP_PORT
EXPOSE $HTTPS_PORT

VOLUME /etc/ssh
VOLUME /var/lib/jenkins
VOLUME /etc/default/jenkins

RUN \
    export DEBIAN_FRONTEND=noninteractive &&\
    apt-get update                        &&\
    apt-get -y install tar                  \
                       nano                 \
                       git                  \
                       htop                 \
                       curl                 \
                       wget                 \
                       psmisc               \
                       daemon               \
                       net-tools            \
                       supervisor           \
                       netstat-nat          \
                       openssh-server       \
                       openjdk-7-jdk      &&\
    apt-get clean                         &&\
    rm -rf /var/cache/apt/

RUN \
    wget ${DOWNLOAD_LINK}/jenkins_${VERSION}_all.deb  &&\
    dpkg -i jenkins_${VERSION}_all.deb                &&\
    rm jenkins_${VERSION}_all.deb

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
