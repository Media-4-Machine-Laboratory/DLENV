## Instruction about Special Images  
We provide many special image on basic image like OpenGL, NeRF and Detectron2  

### OpenGL Image  
tag name : **opengl-cu121**  
#### On Linux  
```bash
sh run.sh
```

You can modify run.sh  
In run.sh, bind source directory to container  

```bash
#!/bin/sh
XSOCK=/tmp/.X11-unix
XAUTH=/tmp/.docker.xauth
touch $XAUTH
xauth nlist $DISPLAY | sed -e 's/^..../ffff/' | xauth -f $XAUTH nmerge -

docker run --runtime=nvidia --gpus 0 --privileged -it \
 -v $XSOCK:$XSOCK:rw -v $XAUTH:$XAUTH:rw -v $HOME:$HOME -v {your-source-directory}:/src/src --env="XAUTHORITY=${XAUTH}"  --env="DISPLAY=${DISPLAY}" --env=TERM=xterm-256color --env=QT_X11_NO_MITSHM=1 \
 --shm-size=10G --net=host --name={container-name} m4ml/dlenv:opengl
```

#### On Windows  
1. You should install Xserver like Xming or VcXsrv on your computer.  
2. Export DISPLAY on WSL  
3. Start container with ...  
   ```bash
   docker run -it --gpus all --privileged -v /tmp/.X11-unix:/tmp/.X11-unix -v {your-source-directory}:/src/src -e DISPLAY=$DISPLAY -e XAUTHORITY=$XAUTH --env=TERM=xterm-256color --env=QT_X11_NO_MITSHM=1 --shm-size=10G --net=host --name={container-name} m4ml/dlenv:opengl
   ```

#### On MacOS  

