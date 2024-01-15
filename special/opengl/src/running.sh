#!/bin/bash
export FILENAME=$2
export SOURCE=$1

python convert.py ${SOURCE} ${FILENAME}

g++ -std=c++11 ${SOURCE}/${FILENAME}.cpp /glad/src/glad.c -Wall -lGL -lGLU -lglut -lGLEW -lglfw -lX11 -lXxf86vm -lXrandr -lpthread -lXi -ldl -lXinerama -lXcursor -o ${SOURCE}/${FILENAME}
${SOURCE}/$FILENAME