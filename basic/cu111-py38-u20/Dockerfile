FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive
ENV PYVER=3.8.17
ENV TORCHVER=111

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
    liblzma-dev

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
RUN apt-get -y install python3-pip
RUN python -m pip install torch torchvision --index-url https://download.pytorch.org/whl/cu${TORCHVER}

# Install requirements
RUN mkdir /src
WORKDIR /src
COPY ./requirements.txt /src
COPY ./install.sh /src