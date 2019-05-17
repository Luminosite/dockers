FROM centos:latest
MAINTAINER Luminosite
VOLUME [ "/opt/product/data/" ]
RUN mkdir /opt/product/tools/
ADD ./tools /opt/product/tools/
ENV JAVA_HOME /opt/product/tools/jdk1.8.0_191
CMD ["/usr/sbin/init"]
