FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV PYVER=3.8.17
ENV TORCHVER=118

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
    libeigen3-dev \
    libgmp-dev \
    libgmpxx4ldbl \
    libmpfr-dev \
    libboost-dev \
    libboost-thread-dev \
    libtbb-dev \
    tk8.6-dev \
    python3.8-tk \
    python3.8-dev

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

# Install pip
WORKDIR /

# Install torch
RUN python -m pip install torch==2.1.2+cu118 torchvision==0.16.2+cu118 --extra-index-url https://download.pytorch.org/whl/cu${TORCHVER}
RUN python -m pip install ninja git+https://github.com/NVlabs/tiny-cuda-nn/#subdirectory=bindings/torch

RUN git clone https://github.com/nerfstudio-project/nerfstudio.git
WORKDIR /nerfstudio
RUN python -m pip install --upgrade pip setuptools
RUN python -m pip install -e .