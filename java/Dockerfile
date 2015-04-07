FROM centos:centos7
MAINTAINER cooniur

RUN yum -y install wget tar && yum clean all

ENV JAVA_VERSION 8u40
ENV JAVA_LONG_VERSION 8u40-b26

ENV JAVA_HOME /apps/java
ENV PATH $JAVA_HOME/bin:$PATH

RUN mkdir -p $JAVA_HOME \
	&& wget --quiet --output-document=/tmp/java.tar.gz \
		--no-cookies --no-check-certificate \
		--header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
		"http://download.oracle.com/otn-pub/java/jdk/$JAVA_LONG_VERSION/server-jre-$JAVA_VERSION-linux-x64.tar.gz" \
	&& tar -xf "/tmp/java.tar.gz" --directory="$JAVA_HOME" --strip-components 1 \
	&& rm /tmp/java.tar.gz*
