FROM openjdk:8-jre-alpine

ENV KIBANA_VERSION="6.4.0"

MAINTAINER Luminosite
VOLUME [ "/opt/product/data/" ]
# create user 'kibana'
RUN apk add --update tar nodejs shadow bash curl && useradd -ms /bin/bash elk

# download and install kibana
ADD ./kibana /usr/local/kibana
RUN cd /usr/local \
  && tar -xzf /usr/local/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz \
  && rm /usr/local/kibana/kibana-${KIBANA_VERSION}-linux-x86_64.tar.gz

RUN rm /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64/config/kibana.yml \
  && mv /usr/local/kibana/kibana.yml /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64/config/ \
  && rm -r /usr/local/kibana

RUN chown -R elk /usr/local/kibana-${KIBANA_VERSION}-linux-x86_64

# fix node installation (https://github.com/elastic/kibana/issues/17015)
ENV KIBANA_DIR=/usr/local/kibana-${KIBANA_VERSION}-linux-x86_64
RUN rm -rf ${KIBANA_DIR}/node \
  && mkdir -p ${KIBANA_DIR}/node/bin \
  && ln -s /usr/bin/node ${KIBANA_DIR}/node/bin/node

# add elasticsearch
RUN mkdir /opt/product/logs/
ADD ./elasticsearch-6.4.0 /opt/product/elasticsearch-6.4.0
ADD init.sh /root/
RUN chown -R elk:elk /opt/product/elasticsearch-6.4.0 && chown -R elk:elk /opt/product/logs

EXPOSE 5601
EXPOSE 9200
EXPOSE 9300
RUN chmod +x /root/init.sh
ENTRYPOINT ["/root/init.sh"]
CMD ["/usr/sbin/init"]
