FROM nvidia/cuda:11.0-base

CMD nvidia-smi

ARG DEBIAN_FRONTEND=noninteractive
ARG LC_ALL=en_US.UTF-8

## Install all OS packages and dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    build-essential \
    software-properties-common \
    curl \
    git \
    wget

# Install python 3.6 (we first need 'software-properties-common' or the ppa)
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update -qq && \
    apt-get install -y python3.6 python3-pip \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# symlinks to the specific python version
RUN ln -s /usr/bin/python3.6 /usr/bin/python && \
    ln -s /usr/bin/pip3 /usr/bin/pip
