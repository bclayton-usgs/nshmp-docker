#!/bin/bash

####
# Install Java
# Globals:
#   (boolean) INSTALL_JDK - Whether to install JDK or JRE
#   (string) JAVA_VERSION - The Java version to install
#   (string) JVM_ROOT - The JVM root directory
# Arguments:
#   None
# Returns:
#   None
####
install_java() {
  # Update
  yum update -y

  # Install Java
  if [ ${INSTALL_JDK} = true ]; then
    yum install -y java-${JAVA_VERSION}-openjdk-devel;
  else
    yum install -y java-${JAVA_VERSION}-openjdk;
    ln -s ${JVM_ROOT}/jre ${JVM_ROOT}/java;
  fi
}

install_java
