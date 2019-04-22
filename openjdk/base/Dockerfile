####
# nshmp Java base image to install Java on the usgs/centos image.
#
# Image: usgsnshmp/nshmp-openjdk:base
####

####
# From image: usgs/centos
# Description:
#   - Install Java
# Build Arguments:
#   JAVA_VERSION - The Java version to download
#   JAVA_PACKAGE - The Java package to install
# Environment Variables:
#   JAVA_HOME - Java home
####
FROM usgs/centos

# Set author
LABEL maintainer="Brandon Clayton <bclayton@usgs.gov>"

# Java home
ENV JAVA_HOME /usr/local/bin/docker-java-home

# Java version to install
ONBUILD ARG JAVA_VERSION

# Whether to install JDK or just JRE
ONBUILD ARG INSTALL_JDK

# Install Java
ONBUILD RUN yum update -y \
  &&  if [ ${INSTALL_JDK} = true ]; then \
        yum install -y java-${JAVA_VERSION}-openjdk-devel; \
      else \
        yum install -y java-${JAVA_VERSION}-openjdk; \
      fi
