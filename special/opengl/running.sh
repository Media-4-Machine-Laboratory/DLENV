#!/bin/bash
export FILENAME=$2
export SOURCE=$1

g++ -std=c++11 ${SOURCE}/${FILENAME}.cpp -Wall -lGL -lGLU -lglut -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -o ${FILENAME}
./$FILENAME