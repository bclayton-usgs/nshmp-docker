#!/bin/bash
#
# Common Bash functions.
####

set -o errexit;
set -o errtrace;

readonly CENTOS_LOG_FILE="/var/log/bash-functions.log";
touch ${CENTOS_LOG_FILE};

####
# Download a repository from Github.
# Globals:
#   (string) CENTOS_LOG_FILE - The log file
# Arguments:
#   (string) user - The Github user
#   (string) repo - The project to download
#   (string) version - The version to download
#   (string) directory - The direcotry name for repo download
# Returns:
#   None
####
download_repo() {
  local usage="download_repo <user> <repo> <version>";

  local user=${1};
  local repo=${2};
  local version=${3};
  local directory=${4};
  local url="https://github.com/${user}/${repo}/archive/${version}.tar.gz";

  if [ ${version} == "null" ]; then
    printf "\n Skipping download of [${user}/${repo}]\n";
    return;
  fi

  printf "\n Downloading [${url}] \n\n";

  if [ -z "${directory}" ]; then
    directory=${repo};
  fi

  curl -L ${url} | tar -xz 2> ${CENTOS_LOG_FILE} || \
      error_exit "Could not download [${url}]" "$(< ${CENTOS_LOG_FILE})" "${usage}";

  mv ${repo}-${version#v*} ${directory};
}

####
# Exit script with error.
# Globals:
#   None
# Arguments:
#   (string) err - The error message
#   (string) logs - The log for the error
#   (string) usage - The Docker usage
# Returns:
#   None
####
error_exit() {
  local err="${1}";
  local logs="${2}";
  local usage="${3}";

  local message="
    Error:
    ${err}

    ----------
    Logs:

    ${logs}

    ----------
    Usage:

    ${usage}

  ";

  printf "${message}";

  exit -1;
}
