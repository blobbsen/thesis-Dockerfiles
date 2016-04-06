#!/bin/bash

# example SLAVE_ARGS="slave.jar -jnlpUrl http://172.17.42.1:8190/computer/androidbuild/slave-agent.jnlp"
#SLAVE_ARGS=$1
SLAVE_ARGS=""
# -noReconnect gives the possibility to kill Docker slaves within Jenkins by disconnecting the slave instance.

if [ "$1" == "swarm" ]; then
  INVOCATION="docker run -i -t -v `pwd`/sshhome/gitslave/.ssh gitslave02 java -jar swarmSlave.jar -noRetryAfterConnected -master http://172.17.42.1:8190 -executors 1 -fsroot /home/gitslave/ -labels git -mode exclusive -name git"
else
  INVOCATION="java -jar slave.jar -noReconnect -jnlpUrl http://172.17.42.1:8190/computer/androidbuild/slave-agent.jnlp"
fi

echo $INVOCATION

docker run --rm \
    \
    -v ${ANDROID_HOME}:/home/androidbuild/android-sdk \
    \
    gitslave02 $INVOCATION
    # androidbuild

#swarm variante
#java -jar swarmSlave.jar -noRetryAfterConnected -master http://172.17.41:8190 -executors 1 -fsroot $HOME -labels androidbuild -mode exclusive -name androidbuild
