# A collection of Docker files for use in the nshmp

## Tomcat
See the [usgsnshmp/nshmp-tomcat](https://hub.docker.com/r/usgsnshmp/nshmp-tomcat)
public Docker image.

### Supported Tags and Dockerfile Links
* [8.5-jre8](tomcat/8.5-jre8/Dockerfile) - Installs Tomcat 8.5 with Java 8
* [8.5-jre11](tomcat/8.5-jre11/Dockerfile) - Installs Tomcat 8.5 with Java 11
* [base](tomcat/base/Dockerfile) - An extendable Tomcat image based on the 
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


## Java
See the [usgsnshmp/nshmp-openjdk](https://hub.docker.com/r/usgsnshmp/nshmp-openjdk)
public Docker image.

### Supported Tags and Dockerfile Links
* [jdk8](openjdk/jdk8/Dockerfile) - Install JDK 8
* [jdk11](openjdk/jdk11/Dockerfile) - Install JDK 11
* [jre8](openjdk/jre8/Dockerfile) - Install JRE 8
* [jre11](openjdk/jre11/Dockerfile) - Install JRE 11
* [base](openjdk/base/Dockerfile) - An extendable Java image based on the 
    [usgs/centos](https://hub.docker.com/r/usgs/centos) image.

### Environment Variables and Defaults
```bash
JAVA_HOME="/usr/local/bin/docker-java-home"
```

### Extending Base Image
```docker
# Java openJDK version to install
ARG JAVA_VERSION=1.8.0

# Install JDK
ARG INSTALL_JDK=true

# Extend base image
FROM usgsnshmp/nshmp-openjdk:base
```
