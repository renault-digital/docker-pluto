# kubernetes pluto

[![Build Status](https://travis-ci.com/renault-digital/docker-pluto.svg?branch=master)](https://travis-ci.com/renault-digital/docker-pluto)

Auto-trigger docker build for [kubernetes pluto](https://github.com/fairwindsops/pluto) when new release is announced.

[![DockerHub Badge](http://dockeri.co/image/renaultdigital/pluto)](https://hub.docker.com/r/renaultdigital/pluto/)

## NOTES

The latest docker tag is the latest release version (https://github.com/pluto/pluto/releases/latest)

Please avoid to use `latest` tag for any production deployment. Tag with right version is the proper way, such as `renaultdigital/pluto:3.1.1`

### Github Repo

https://github.com/renault-digital/pluto

### Daily Travis CI build logs

https://travis-ci.org/renault-digital/pluto

### Docker image tags

https://hub.docker.com/r/renaultdigital/pluto/tags/

# Usage

    # for help
    docker run --rm renaultdigital/pluto

    # mount current folders in container and output scan result
    docker run --rm -v $PWD:/apps renaultdigital/pluto detect-files .

# Why we need it

Mostly it is used during CI/CD (continuous integration and continuous delivery) or as part of an automated build/deployment

# The Processes to build this image

* Enable Travis CI cronjob on this repo to run build daily on master branch
* Check if there are new tags/releases announced via Github REST API
* Match the exist docker image tags via Hub.docker.io REST API
* If not matched, build the image with release version and push to https://hub.docker.com/
* Get the latest version from https://github.com/fairwindsops/pluto/releases/latest, pull the image with that version, tag as `renaultdigital/pluto:latest` and push to hub.docker.com

# Credits

- Borrowed from [docker-helm](https://github.com/renault-digital/docker-helm).
- Original works from https://github.com/alpine-docker/pluto.
