## Varnish Dockerfile


This repository contains **Dockerfile** of [Varnish](https://www.varnish-cache.org/) for [Docker](https://www.docker.com/)'s [automated build](https://registry.hub.docker.com/u/hwestphal/varnish/) published to the public [Docker Hub Registry](https://registry.hub.docker.com/).


### Base Docker Image

* [dockerfile/ubuntu](http://dockerfile.github.io/#/ubuntu)


### Usage

Create a Varnish data directory on your host and put there a [`default.vcl`](https://www.varnish-cache.org/docs/4.0/users-guide/vcl.html) file, then

    docker run -d -p 80:80 -v <persistent-data-dir>:/data hwestphal/varnish
