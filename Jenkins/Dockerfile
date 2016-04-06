FROM debian:jessie
MAINTAINER andre@blobb.me
ENV SSH_PORT 22
ENV HTTP_PORT 8080
ENV HTTPS_PORT 4333
ENV JNLP_PORT 5000

EXPOSE $SSH_PORT
EXPOSE $JNLP_PORT
EXPOSE $HTTP_PORT
EXPOSE $HTTPS_PORT

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


ENV JENKINS_HOME /var/lib/jenkins
ENV DOWNLOAD_LINK http://ftp.nluug.nl/programming/jenkins/debian
ENV VERSION 1.645

RUN groupadd -g 1000 1000 \
    && useradd -d "$JENKINS_HOME" -u 1000 -g 1000 -m -s /bin/bash jenkins

RUN \
    wget ${DOWNLOAD_LINK}/jenkins_${VERSION}_all.deb  &&\
    dpkg -i jenkins_${VERSION}_all.deb                &&\
    rm jenkins_${VERSION}_all.deb

VOLUME /etc/ssh
VOLUME $JENKINS_HOME

# Note: if you need a highly customized jenkins configuration file
# VOLUME /etc/default/jenkins

RUN chown jenkins /var/lib/jenkins
RUN chgrp jenkins /var/lib/jenkins

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
CMD ["/usr/bin/supervisord"]
