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
      * [Build](#build)
      * [Run interactive](#run-interactive)
      * [Publish](#publish)

<!-- Added by: jose, at: Sun Feb 21 19:30:06 CET 2021 -->

<!--te-->

## Requirements

 * A CUDA enabled NVIDIA gpu and [its drivers](https://github.com/NVIDIA/nvidia-docker/wiki/Frequently-Asked-Questions#how-do-i-install-the-nvidia-driver)
 * Docker with [CUDA toolkit](https://github.com/NVIDIA/nvidia-docker)
   ([installation guide](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/install-guide.html#docker))

## Images

### py-cuda

 * `9.2-py3.6` CUDA 9.2 and python 3.6 base image
 * `11.0-py3.6` CUDA 11 and python 3.6 base image


## Build

```bash
    make build-docker py=3.6 cuda=9.2
```

## Run interactive

```bash
    make run-interactive py=3.6 cuda=9.2
```

## Publish

```bash
    make publish py=3.6 cuda=9.2
```
