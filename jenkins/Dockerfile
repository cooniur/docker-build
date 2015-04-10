FROM cooniur/java:latest
MAINTAINER cooniur

ENV GROOVY_VERSION 2.4.3
ENV MAVEN_VERSION 3.3.1
ENV JENKINS_VERSION 1.608

ENV MAVEN_HOME /apps/apache-maven
ENV GROOVY_HOME /apps/groovy-2.4.3

ENV JENKINS_INSTALL /apps/jenkins/bin
ENV JENKINS_HOME /jenkins

ENV PATH $GROOVY_HOME/bin:$MAVEN_HOME/bin:$PATH

RUN yum -y install unzip git && yum clean all \
	&& wget --quiet --output-document=/tmp/groovy.zip \
		"http://dl.bintray.com/groovy/maven/groovy-binary-2.4.3.zip" \
	&& unzip /tmp/groovy.zip -d /apps/ \
	&& rm /tmp/groovy.zip*

RUN mkdir -p $MAVEN_HOME \
	&& wget --quiet --output-document=/tmp/maven.tar.gz \
		"http://www.us.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-3.3.1-bin.tar.gz" \
	&& tar -xf "/tmp/maven.tar.gz" --directory="$MAVEN_HOME" --strip-components 1 \
	&& rm /tmp/maven.tar.gz*

RUN mkdir -p $JENKINS_HOME \
	&& mkdir -p $JENKINS_INSTALL \
	&& wget --quiet --output-document=$JENKINS_INSTALL/jenkins.war \
		"http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war" \
	&& chmod 0644 $JENKINS_INSTALL/jenkins.war

VOLUME ["/jenkins"]

EXPOSE 8080

CMD ["java", "-jar", "/apps/jenkins/bin/jenkins.war"]
