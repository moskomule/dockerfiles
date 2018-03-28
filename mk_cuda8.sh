#!/bin/bash

# semi-automatically update cuda8
echo "FROM nvidia/cuda:8.0-cudnn6-devel-ubuntu16.04" > ./miniconda-gpu8/Dockerfile
tail -n +2 ./miniconda-gpu/Dockerfile >> ./miniconda-gpu8/Dockerfile
