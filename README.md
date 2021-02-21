# Py-CUDA Docker images

This repository contains base dockerfiles with python and typical libraries and utilities
together with CUDA.

## ToC

<!--ts-->
   * [Py-CUDA Docker images](#py-cuda-docker-images)
      * [ToC](#toc)
      * [Requirements](#requirements)
      * [Images](#images)
         * [py-cuda](#py-cuda)

<!-- Added by: jose, at: Sun Feb 21 18:20:39 CET 2021 -->

<!--te-->

## Requirements

 * A CUDA enabled NVIDIA gpu and [its drivers](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver)
 * Docker with [CUDA toolkit](https://github.com/NVIDIA/nvidia-docker)
   ([installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker))

## Images

### py-cuda

 * `11.0-py36` CUDA 11 and python 3.6 base image
