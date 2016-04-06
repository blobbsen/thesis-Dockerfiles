FROM debian:jessie

MAINTAINER andre@blobb.me

RUN apt-get -y update &&\
    apt-get -y install \
    \
    openjdk-7-jdk \
    tar \
    ant \
    gradle \
    && \
    apt-get clean && \
    rm -rf /var/cache/apt/*

RUN groupadd -g 1000 1000 \
      && useradd -d "/home/androidbuild" -u 1000 -g 1000 -m -s /bin/bash androidbuild

COPY slave.jar 	/home/androidbuild/slave.jar
COPY swarmSlave.jar  /home/androidbuild/swarmSlave.jar

VOLUME /home/androidbuild/android-sdk
ENV ANDROID_HOME /home/androidbuild/android-sdk

RUN echo "PATH=$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools" >> /home/androidbuild/.bashrc

USER androidbuild
WORKDIR /home/androidbuild/

### only if selfsigned certificate
# COPY cert.pem  	/home/androidbuild/cert.pem
# RUN echo y | keytool -import -alias ca -file /home/androidbuild/cert.pem -keystore $(readlink -f /usr/bin/java | sed "s:bin/java::")/lib/security/cacerts -storepass changeit
# RUN rm /home/androidbuild/cert.pem
