.PHONY: clean readme-toc build-docker run-interactive publish

JOBS ?= 1

help:
	@echo "    clean"
	@echo "        Remove Python/build artifacts."
	@echo "    readme-toc"
	@echo "			Generate a Table Of Content for the README.md"
	@echo "	   build-docker"
	@echo "		   Builds docker image of the current version."
	@echo "	   run-interactive"
	@echo "		   Run bash inside the container."
	@echo "	   publish"
	@echo "		   Publishes the image to docker-hub."


clean:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f  {} +
	find . -name 'README.md.*' -exec rm -f  {} +
	rm -rf build/
	rm -rf .pytype/
	rm -rf dist/
	rm -rf docs/_build
	# careful with these two:
	rm -rf *egg-info
	rm -rf pip-wheel-metadata

readme-toc:
	# https://github.com/ekalinin/github-markdown-toc
	find . -name README.md -exec gh-md-toc --insert {} \;

build-docker:
	bash ./scripts/build-docker.sh

run-interactive:
	docker run -it --rm --gpus all jmrf/py-cuda:11.0-py36 /bin/bash

publish:
	docker push jmrf/py-cuda:11.0-py36

all: readme-toc clean build-docker publish
