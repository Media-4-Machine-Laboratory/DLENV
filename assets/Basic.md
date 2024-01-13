## Instructions about Basic Images  
1. Choose image's tag  
   Tag contain version of cuda, python and base-ubuntu.  
   
   you can choice cuda version like cu{version}  
   you can choice python version like py{version}  
   you can choice ubuntu version like u{version}... (For now, We only support ubuntu20.04)  

   You can choice image's tag on terminal like ...
   ```bash
   docker pull m4ml/dlenv:cu{cuda-version}-py{python-version}-u{ubuntu-version}

   // Actual command
   docker pull m4ml/dlenv:cu121-py311-u20
   ```


2. Start Container with pulled image  
   You should choose your gpu number  
   If you want to choose all of your gpu, You can choice gpu number like "gpus all"  

   Actual Command is like...  
   ```bash
   docker run -it --gpus all --name=m4ml m4ml/dlenv:cu121-py311-u20
   ```  

   If you want to bind your workspace on container, You can command like...

   ```bash
   docker run -it --gpus all --name=m4ml -v {your-workspace}:/src/ m4ml/dlenv:cu121-py311-u20
   ```