FROM debian:jessie

MAINTAINER andre@blobb.me

RUN apt-get -y update &&\
    apt-get -y install \
    \
    openjdk-7-jdk \
    tar \
    ant \
    gradle \
    lib32stdc++6 \
    lib32z1 \
    && \
    apt-get clean && \
    rm -rf /var/cache/apt/*

RUN groupadd -g 1000 1000 \
      && useradd -d "/home/androidbuild" -u 1000 -g 1000 -m -s /bin/bash androidbuild

COPY slave.jar 	/home/androidbuild/slave.jar
COPY swarmSlave.jar  /home/androidbuild/swarmSlave.jar

VOLUME /home/androidbuild/android-sdk
ENV ANDROID_HOME /home/androidbuild/android-sdk
ENV PATH /usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/androidbuild/android-sdk/platform-tools:/home/androidbuild/android-sdk/tools

USER androidbuild
WORKDIR /home/androidbuild/

### only if selfsigned certificate
# COPY cert.pem  	/home/androidbuild/cert.pem
# RUN echo y | keytool -import -alias ca -file /home/androidbuild/cert.pem -keystore $(readlink -f /usr/bin/java | sed "s:bin/java::")/lib/security/cacerts -storepass changeit
# RUN rm /home/androidbuild/cert.pem
