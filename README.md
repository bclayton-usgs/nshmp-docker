# A collection of Docker files for use in the nshmp

## Tomcat

### Supported Tags and Dockerfile Links
* [8.5-jre8](tomcat/8.5-jre8) - Installs Tomcat 8.5 with Java 8
* [8.5-jre11](tomcat/8.5-jre11) - Installs Tomcat 8.5 with Java 11
* [base](tomcat/base) - An extendable Tomcat image based on the 
    [usgs/centos](https://hub.docker.com/r/usgs/centos) image.

### Environment Variables and Defaults
```bash
CATALINA_HOME="/usr/local/tomcat"
TOMCAT_WEBAPPS="${CATALINA_HOME}/webapps"
```

### Deploying a Web Application

#### Dockerfile
```docker
# Use Tomcat 8.5 with Java 8 image
FROM usgsnshmp/nshmp-tomcat:8.5-jre8

# Copy war file to Tomcat webapps directory
COPY path/to/war/file ${TOMCAT_WEBAPPS}
```

#### Build and Run Image
```bash
# Build
docker build -t <IMAGE_NAME>:<IMAGE_TAG> .

# Run image
docker run -d -p <PORT>:8080 <IMAGE_NAME>:<IMAGE_TAG>
```

Where:
* `<IMAGE_NAME>` is the name of the image to build/run
* `<IMAGE_TAG>` is the tag name for the image
* `<PORT>` is the port to run the image on

### Extending Base Image
```docker
# Tomcat version to install
ARG TOMCAT_MAJOR=8
ARG TOMCAT_VERSION=${TOMCAT_MAJOR}.5.40

# Java version to install
ARG JAVA_VERSION=1.8.0

# Java memory
ARG JAVA_OPTS="-Xms1g -Xmx8g"

# Extend base image
FROM usgsnshmp/nshmp-tomcat:base
```
