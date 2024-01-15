FROM nvidia/cuda:12.1.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ARG SOURCE=./src
ENV PYVER=3.11.7
ENV TORCHVER=121

RUN apt-get -y update && apt-get -y install \
    ca-certificates \
    git \
    wget \
    sudo \
    ninja-build \
    build-essential \
    zlib1g-dev \
    libncurses5-dev \
    libgdbm-dev \
    libnss3-dev \
    libssl-dev \
    libreadline-dev \
    libffi-dev \
    wget \
    libglib2.0-0 \
    libgl1-mesa-glx \
    libbz2-dev \ 
    liblzma-dev \
    gcc \
    g++ \
    lsb-release \
    libeigen3-dev \
    cmake \
    libx11-dev \
    xorg-dev \
    libglu1-mesa-dev \
    freeglut3-dev \
    libglew1.5 \
    libglu1-mesa \
    libglew1.5-dev \
    libgl1-mesa-dev \
    libglfw3-dev \
    libglfw3 \
    python3-pip \
    libglm-dev

# python install
RUN wget https://www.python.org/ftp/python/${PYVER}/Python-${PYVER}.tgz
RUN tar -xf Python-${PYVER}.tgz
WORKDIR /Python-${PYVER}
RUN ./configure
RUN ./configure --enable-optimizations
RUN make altinstall

# Change python version
WORKDIR /usr/bin
RUN find /usr/bin/ -name "pytho*" -exec rm {} \;
RUN ln -s -f /Python-${PYVER}/python python
RUN ln -s -f /Python-${PYVER}/python python3
RUN rm /Python-${PYVER}.tgz

# Install pip modules
WORKDIR /

RUN python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu${TORCHVER}
RUN git clone https://github.com/Dav1dde/glad.git

WORKDIR /glad/cmake
RUN cmake .
RUN make
WORKDIR /glad
RUN bash ./utility/download.sh
RUN bash ./utility/generateall.sh
RUN cp -r include/* /usr/include

# Install requirements
RUN mkdir /src
WORKDIR /src
COPY makefile /src/