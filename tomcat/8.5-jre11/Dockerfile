####
# Installs Java 11 with Tomcat 8.5 in the usgs/centos image by extending
# the usgsnshmp/nshmp-tomcat:base image.
#
# Tag: 8.5-jre11
#
# Deploy webapps in the usgsnshmp/nshmp-tomcat:8.5-jre11 Docker container:
#
# FROM usgsnshmp/nshmp-tomcat:8.5-jre11
# COPY path/to/war/file ${TOMCAT_WEBAPPS}
####

# Tomcat version to install
ARG TOMCAT_MAJOR=8
ARG TOMCAT_VERSION=${TOMCAT_MAJOR}.5.40

# Java version to install
ARG JAVA_VERSION=11

# Java memory
ARG JAVA_OPTS="-Xms1g -Xmx8g"

####
# From image: usgsnshmp/nshmp-tomcat:base
# Description: Build Tomcat 8.5 with Java 11 from nshmp-tomcat base image.
####
FROM usgsnshmp/tomcat:base
