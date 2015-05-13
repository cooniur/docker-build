FROM cooniur/java:latest
MAINTAINER cooniur

# Version
ENV GROOVY_VERSION 2.4.3
ENV MAVEN_VERSION 3.3.3
ENV JENKINS_VERSION 1.613

ENV MAVEN_HOME /apps/apache-maven
ENV GROOVY_HOME /apps/groovy-2.4.3

ENV JENKINS_INSTALL /apps/jenkins/bin
ENV JENKINS_HOME /jenkins

ENV PATH $GROOVY_HOME/bin:$MAVEN_HOME/bin:$PATH

# Install Groovy
RUN yum -y install unzip git && yum clean all \
	&& wget --quiet --output-document=/tmp/groovy.zip \
		"http://dl.bintray.com/groovy/maven/groovy-binary-${GROOVY_VERSION}.zip" \
	&& unzip /tmp/groovy.zip -d /apps/ \
	&& rm /tmp/groovy.zip*

# Install Maven
RUN mkdir -p $MAVEN_HOME \
	&& wget --quiet --output-document=/tmp/maven.tar.gz \
		"http://www.us.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz" \
	&& tar -xf "/tmp/maven.tar.gz" --directory="$MAVEN_HOME" --strip-components 1 \
	&& rm /tmp/maven.tar.gz*

# Install Jenkins
RUN mkdir -p $JENKINS_HOME \
	&& mkdir -p $JENKINS_INSTALL \
	&& wget --quiet --output-document=$JENKINS_INSTALL/jenkins.war \
		"http://mirrors.jenkins-ci.org/war/$JENKINS_VERSION/jenkins.war" \
	&& chmod 0644 $JENKINS_INSTALL/jenkins.war

# Install EPEL-RELEASE
RUN yum -y install epel-release && yum clean all

# Install Ansible, AWS-CLI, Boto (AWS lib in Python)
RUN yum -y install ansible && yum clean all \
	&& curl "https://bootstrap.pypa.io/get-pip.py" -o "/tmp/get-pip.py" \
	&& python /tmp/get-pip.py \
	&& pip install awscli \
	&& pip install boto \
	&& rm -f /tmp/get-pip/py \
	&& rm -rf /tmp/pip_build_root

# Install node, npm, bower & gulp
ENV NODE_VERSION=0.12.2
ENV NODE_HOME=/apps/node
ENV NPM_VERSION=2.7.5

RUN yum -y install bzip2 && yum clean all \
	&& wget --output-document=/tmp/node.tar.gz \
		"http://nodejs.org/dist/v$NODE_VERSION/node-v${NODE_VERSION}-linux-x64.tar.gz" \
	&& mkdir -p $NODE_HOME \
	&& tar xzf /tmp/node.tar.gz --strip-components 1 -C $NODE_HOME \
	&& rm -f /tmp/node.tar.gz

ENV PATH $NODE_HOME/bin:$PATH

RUN npm install npm@$NPM_VERSION -g \
	&& npm install bower gulp -g \
	&& npm cache clean

# Jenkins' home is in /jenkins
# AWS credentials goes to /root/.aws
VOLUME ["/jenkins", "/root/.aws"]

EXPOSE 8080

ENV JENKINS_TIMEZONE=UTC

CMD java -jar -Dorg.apache.commons.jelly.tags.fmt.timeZone=$JENKINS_TIMEZONE /apps/jenkins/bin/jenkins.war
