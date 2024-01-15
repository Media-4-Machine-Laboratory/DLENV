#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker rm dlenv-opengl

docker run --runtime=nvidia --gpus 0 --privileged -it \
 -v $XSOCK:$XSOCK:rw -v $XAUTH:$XAUTH:rw -v $HOME:$HOME -v ./src:/src/ --env="XAUTHORITY=${XAUTH}"  --env="DISPLAY=${DISPLAY}" --env=TERM=xterm-256color --env=QT_X11_NO_MITSHM=1 \
 --shm-size=10G --net=host --name=dlenv-opengl m4ml/dlenv:opengl