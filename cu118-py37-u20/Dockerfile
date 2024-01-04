FROM nvidia/cuda:11.8.0-cudnn8-devel-ubuntu20.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update && apt-get -y install python3-opencv ca-certificates python3-dev git wget sudo ninja-build
RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
