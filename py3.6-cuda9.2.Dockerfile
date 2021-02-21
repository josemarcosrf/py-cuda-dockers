FROM nvidia/cuda:9.2-base

CMD nvidia-smi

ARG DEBIAN_FRONTEND=noninteractive
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8

## Install all OS packages and dependencies
RUN apt-get update -qq && \
    apt-get install -y --no-install-recommends \
    locales locales-all \
    build-essential \
    software-properties-common \
    curl \
    gcc \
    git \
    wget

# Install python 3.6 (we first need 'software-properties-common' or the ppa)
RUN add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update -qq && \
    apt-get install -y python3.6 python3-pip -f python3.6-dev \
    && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# symlinks to the specific python version
RUN ln -s -f /usr/bin/python3.6 /usr/bin/python && \
    ln -s -f /usr/bin/pip3 /usr/bin/pip
