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

# Copy over entrypoint
COPY docker-entrypoint.sh .

# JVM root path
ENV JVM_ROOT /usr/lib/jvm

# Java install home
ENV JAVA_HOME ${JVM_ROOT}/java

# Update path with Java
ENV PATH ${PATH}:${JAVA_HOME}/bin

# Java version to install
ONBUILD ARG JAVA_VERSION

# Whether to install JDK or just JRE
ONBUILD ARG INSTALL_JDK

# Run entrypoint script
ONBUILD RUN bash docker-entrypoint.sh
