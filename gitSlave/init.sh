#!/bin/bash

# example SLAVE_ARGS="slave.jar -jnlpUrl http://172.17.42.1:8190/computer/androidbuild/slave-agent.jnlp"
#SLAVE_ARGS=$1
SLAVE_ARGS=""
# -noReconnect gives the possibility to kill Docker slaves within Jenkins by disconnecting the slave instance.

MASTER=$1
if [ "$2" == "swarm" ]; then
  INVOCATION="docker run -i -t -v `pwd`/ssh/:/home/gitslave/.ssh gitslave02 java -jar swarmSlave.jar -noRetryAfterConnected -master http://172.17.42.1:8190 -executors 1 -fsroot /home/gitslave/ -labels git -mode exclusive -name git"
else
  INVOCATION="java -jar slave.jar -noReconnect -jnlpUrl http://172.17.42.1:8190/computer/androidbuild/slave-agent.jnlp"
fi

echo -e "\n$INVOCATION\n"

docker run --rm \
    \
    -v `pwd`/ssh/:/home/gitslave/.ssh \
    \
    gitslave02 $INVOCATION

#swarm variante
#java -jar swarmSlave.jar -noRetryAfterConnected -master http://172.17.41:8190 -executors 1 -fsroot $HOME -labels androidbuild -mode exclusive -name androidbuild
