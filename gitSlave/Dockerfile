FROM debian:jessie
MAINTAINER andre@blobb.me

RUN apt-get update
RUN apt-get install -y \
    \
    git \
    tar \
    openjdk-7-jre-headless

RUN groupadd -g 1000 1000 \
    && useradd -d "/home/gitslave" -u 1000 -g 1000 -m -s /bin/bash gitslave

VOLUME /home/gitSlave/.ssh

COPY slave.jar 	/home/gitslave/slave.jar
COPY swarmSlave.jar  /home/gitslave/swarmSlave.jar

USER gitslave
WORKDIR /home/gitslave

RUN git config --global user.email "gitJenkinsSlave@blobb.me"
RUN git config --global user.name "Jenkins node"
