## DLENV : DeepLearning ENVironment.  
  
This is environment of deep learning & machin learning.  
  
Base-Support Software : pytorch / cuda / ubuntu20.04.  
This image can run torchvision & opencv.  

You can see these images on DockerHub : [https://hub.docker.com/r/m4ml/dlenv](https://hub.docker.com/r/m4ml/dlenv)

## Basic Images.  

Instruction : [Basic.md](assets/Basic.md).  


### Latest Images.  
These images provide basic deep learning frameworks.  

**based on nvidia/cuda:12.1.1-cudnn8-devel**  

> cu121-py38-u20  
> cuda: 12.1.1 / pytorch: cu121 / python3.8.17 / ubuntu20.04  

> cu121-py39-u20  
> cuda: 12.1.1 / pytorch: cu121 / python3.9.18 / ubuntu20.04  

> cu121-py310-u20  
> cuda: 12.1.1 / pytorch: cu121 / python3.10.13 / ubuntu20.04

> cu121-py311-u20  
> cuda: 12.1.1 / pytorch: cu121 / python3.11.7 / ubuntu20.04    

**based on nvidia/cuda:11.8.0-cudnn8-devel**  

> cu118-py38-u20  
> cuda: 11.8.0 / pytorch: cu118 / python3.8.17 / ubuntu20.04  

> cu118-py39-u20  
> cuda: 11.8.0 / pytorch: cu118 / python3.9.18 / ubuntu20.04  

> cu118-py310-u20  
> cuda: 11.8.0 / pytorch: cu118 / python3.10.13 / ubuntu20.04

> cu118-py311-u20  
> cuda: 11.8.0 / pytorch: cu118 / python3.11.7 / ubuntu20.04    


See More Versions or Previous Version : [AllImages.md](assets/AllImages.md)  


## Special Images.  
These images support additional software.  
Instruction : [Special.md](assets/Special.md)

**opengl framework**
> **opengl-cu121**  
> cuda: 12.1.1 / pytorch: cu121 / python: 3.11.7 / ubuntu20.04 / gcc / g++ / c++11 / opengl libraries: glfw, glew, glut  
> 
> **This image is tested on linux/amd64**