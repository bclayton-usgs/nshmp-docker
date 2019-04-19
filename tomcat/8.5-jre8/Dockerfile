####
# Installs Java 8 with Tomcat 8.5 in the usgs/centos image by extending
# the usgsnshmp/nshmp-tomcat:base image.
#
# Tag: 8.5-jre8
#
# Deploy webapps in the usgsnshmp/nshmp-tomcat:8.5-jre8 Docker container:
#
# FROM usgsnshmp/nshmp-tomcat:8.5-jre8
# COPY path/to/war/file ${TOMCAT_WEBAPPS}
####

# Tomcat version to install
ARG TOMCAT_MAJOR=8
ARG TOMCAT_VERSION=${TOMCAT_MAJOR}.5.40

# Java version to install
ARG JAVA_VERSION=1.8.0

# Java memory
ARG JAVA_OPTS="-Xms1g -Xmx8g"

####
# From image: usgsnshmp/nshmp-tomcat:base
# Description: Build Tomcat 8.5 with Java 8 from nshmp-tomcat base image.
####
FROM usgsnshmp/nshmp-tomcat:base
