 #!/usr/bin/env bash

say() {
 echo "$@" | sed \
         -e "s/\(\(@\(red\|green\|yellow\|blue\|magenta\|cyan\|white\|reset\|b\|u\)\)\+\)[[]\{2\}\(.*\)[]]\{2\}/\1\4@reset/g" \
         -e "s/@red/$(tput setaf 1)/g" \
         -e "s/@green/$(tput setaf 2)/g" \
         -e "s/@yellow/$(tput setaf 3)/g" \
         -e "s/@blue/$(tput setaf 4)/g" \
         -e "s/@magenta/$(tput setaf 5)/g" \
         -e "s/@cyan/$(tput setaf 6)/g" \
         -e "s/@white/$(tput setaf 7)/g" \
         -e "s/@reset/$(tput sgr0)/g" \
         -e "s/@b/$(tput bold)/g" \
         -e "s/@u/$(tput sgr 0 1)/g"
}

check_var() {
    varname=$1
    if [ -z ${!varname} ]
    then
        say @red[["Please set the env. variable $varname before running this script"]]
        exit 1;
    else
        say @green[["Var $varname exists: ${!varname}"]]
    fi
}

# check current directory
current_dir=${PWD##*/}
if [ "$current_dir" == "scripts" ]; then
    say @red[["This scripts should be executed from the root folder as: ./scripts/build_docker.sh"]]
    exit
fi

DEFAULT_PY_VERSION=3.6
DEFAULT_CUDA_VERSION=11.0

PY_VERSION=$1
if [ -z "$PY_VERSION" ]
  then
    say @yellow[["PY_VERSION not specified. Using default PY_VERSION=$DEFAULT_PY_VERSION"]]
    say @blue[["You can pass the PY_VERSION to the script. i.e.: build_doker.sh 3.6 11.0"]]
    PY_VERSION=$DEFAULT_PY_VERSION
    # exit 1;
fi

CUDA_VERSION=$2
if [ -z "$CUDA_VERSION" ]
  then
    say @yellow[["CUDA_VERSION not specified. Using default CUDA_VERSION=$DEFAULT_CUDA_VERSION"]]
    say @blue[[" You can pass the CUDA_VERSION to the script. i.e.: build_doker.sh 3.6 11.0"]]
    CUDA_VERSION=$DEFAULT_CUDA_VERSION
    # exit 1;
fi


DOCKER_FILE=py$PY_VERSION-cuda$CUDA_VERSION.Dockerfile
if [ -f $DOCKER_FILE ]; then

    # build docker file:
    docker build --rm \
        -t jmrf/py-cuda:$CUDA_VERSION-py$PY_VERSION \
        -f $DOCKER_FILE .
else
    say @red[["$DOCKER_FILE doesn't exist. Correct python and CUDA versions?"]]
fi
