FROM cooniur/java:latest
MAINTAINER cooniur

ENV MAVEN_VERSION 3.3.1

ENV MAVEN_HOME /apps/apache-maven
ENV PATH $MAVEN_HOME/bin:$PATH

RUN mkdir -p $MAVEN_HOME \
	&& wget --quiet --output-document=/tmp/maven.tar.gz \
		"http://www.us.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-3.3.1-bin.tar.gz" \
	&& tar -xf "/tmp/maven.tar.gz" --directory="$MAVEN_HOME" --strip-components 1 \
	&& rm /tmp/maven.tar.gz*
