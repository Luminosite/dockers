#!/bin/bash

echo "I am in!!!"

su - elk <<en
whoami

export JAVA_HOME=/opt/product/tools/jdk1.8.0_191
export PATH=$JAVA_HOME/bin:$PATH
export KIBANA_VERSION="6.4.0"

nohup /opt/product/elasticsearch-6.4.0/bin/elasticsearch > /opt/product/logs/elastic.log 2>&1 &
/usr/local/kibana-${KIBANA_VERSION}-linux-x86_64/bin/kibana
en
