FROM openshift/base-centos7
MAINTAINER Chengchang Wang <chengchang.wang@vipshop.com>

EXPOSE 8587

ENV IMAGE_VERSION 1.0

LABEL io.k8s.description="Virtual Vehicle Authentication Service" \
      io.k8s.display-name="Authentication" \
      io.openshift.expose-services="8587:http" \
      io.openshift.tags="builder,service,authentication" \
      io.openshift.s2i.destination="/opt/s2i/destination"

ADD vehicle /apps/

RUN chmod -R go+rw /apps && \
	chmod +x /apps/start.sh

WORKDIR /apps	
ENTRYPOINT ["/bin/bash", "./start.sh"]
