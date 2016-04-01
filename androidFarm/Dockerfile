FROM debian:jessie
MAINTAINER andre@blobb.me

# brauch ich glaube ich gar nicht
# EXPOSE 4242

ENV HOME=/home/androidfarm

VOLUME files ${HOME}/files
VOLUME supervisord.conf /etc/supervisor/conf.d/supervisord.conf

COPY slave.jar 	${HOME}/slave.jar
COPY swarmSlave.jar  ${HOME}/swarmSlave.jar

RUN apt-get -y update &&\
    apt-get -y install \
    \
    android-tools-adb \
    android-tools-fastboot \
    openjdk-7-jre-headless \
    supervisor \
    && \
    apt-get clean && \
    rm -rf /var/cache/apt/*

### only if selfsigned certificate
# COPY cert.pem  	${HOME}/cert.pem
# RUN echo y | keytool -import -alias ca -file /home/androidfarm/cert.pem -keystore $(readlink -f /usr/bin/java | sed "s:bin/java::")/lib/security/cacerts -storepass changeit
# RUN rm /home/androidfarm/cert.pem

RUN useradd -s /bin/bash androidfarm
RUN chown root:androidfarm /usr/bin/adb
RUN chmod 4550 /usr/bin/adb

CMD ["/usr/bin/supervisord"]
