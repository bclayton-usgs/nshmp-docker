####
# nshmp Tomcat base image to install Java and Tomcat on the usgs/centos image.
#
# Tag: base
####

####
# From image: usgs/centos
# Description:
#   - Install Java
#   - Install Tomcat
#   - Run Tomcat on usgs/centos image
# Build Arguments:
#   JAVA_OPTS - The Java initial and maximum memory allocation
#   JAVA_VERSION - The Java version to download
#   TOMCAT_MAJOR - The Tomcat major version number
#   TOMCAT_URL - The URL to download Tomcat
#   TOMCAT_VERSION - The Tomcat version to download
# Environment Variables:
#   CATALINA_HOME - Tomcat install directory
#   PATH - Adds CATALINA_HOME/bin to path
#   TOMCAT_SOURCE - The Tomcat source URL to download
#   TOMCAT_WEBAPPS - The Tomcat webapps directory path
####
FROM usgsnshmp/nshmp-centos

# Set author
LABEL maintainer="Brandon Clayton <bclayton@usgs.gov>"

# Tomcat home
ENV CATALINA_HOME /usr/local/tomcat

# Set working directory
WORKDIR ${CATALINA_HOME}

# Add Tomcat to path
ENV PATH ${CATALINA_HOME}/bin:${PATH}

# Webapp directory
ENV TOMCAT_WEBAPPS ${CATALINA_HOME}/webapps

# Tomcat source URL
ENV TOMCAT_SOURCE http://archive.apache.org/dist/tomcat

# Set LANG
ENV LANG en_US.UTF-8

# JVM root path
ENV JVM_ROOT /usr/lib/jvm

# Java install home
ENV JAVA_HOME ${JVM_ROOT}/java

# Tomcat version to install
ONBUILD ARG TOMCAT_MAJOR
ONBUILD ARG TOMCAT_VERSION
ONBUILD ARG TOMCAT_URL=${TOMCAT_SOURCE}/tomcat-${TOMCAT_MAJOR}/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz

# Java version to install
ONBUILD ARG JAVA_VERSION

# Set Java initial and maximum memory
ONBUILD ARG JAVA_OPTS
ONBUILD ENV JAVA_OPTS ${JAVA_OPTS}

# Install Java and Tomcat
ONBUILD RUN yum update -y \
  && yum install -y java-${JAVA_VERSION}-openjdk-devel \
  && curl -L ${TOMCAT_URL} | tar -xz --strip-components=1

# Expose port
ONBUILD EXPOSE 8080

# Run tomcat
ONBUILD CMD [ "catalina.sh", "run" ]
