FROM dockerfile/ubuntu
MAINTAINER Harald Westphal <h.westphal@gmx.de>

RUN \
  DEBIAN_FRONTEND=noninteractive \
  apt-get -q -y update && \
  apt-get -q -y install apt-transport-https && \
  curl -s https://repo.varnish-cache.org/ubuntu/GPG-key.txt | apt-key add - && \
  echo "deb https://repo.varnish-cache.org/ubuntu/ trusty varnish-4.0" >> /etc/apt/sources.list.d/varnish-cache.list && \
  apt-get -q -y update && \
  apt-get -q -y install varnish

EXPOSE 80

WORKDIR /data

VOLUME ["/data"]

CMD varnishd -f /data/default.vcl -s file,/data/cache && sleep 3 && varnishlog -a -w /data/log/varnish.log
