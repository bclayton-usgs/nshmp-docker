#!/bin/bash
#
# Common Bash functions.
####

set -o errexit;
set -o errtrace;

readonly LOG_FILE="bash-functions.log";

####
# Download a repository from Github.
# Globals:
#   (string) LOG_FILE - The log file
# Arguments:
#   (string) user - The Github user
#   (string) repo - The project to download
#   (string) version - The version to download
# Returns:
#   None
####
download_repo() {
  # Set trap for uncaught errors
  trap 'error_exit "${BASH_COMMAND}" "$(< ${LOG_FILE})"' ERR;

  local usage="download_repo <user> <repo> <version>";

  local user=${1};
  local repo=${2};
  local version=${3};
  local url="https://github.com/${user}/${repo}/archive/${version}.tar.gz";

  printf "\n Downloading [${url}] \n\n";

  curl -L ${url} | tar -xz 2> ${LOG_FILE} || \
      error_exit "Could not download [${url}]" "$(< ${LOG_FILE})" "${usage}";

  mv ${repo}-${version#v*} ${repo};
}

####
# Exit script with error.
# Globals:
#   None
# Arguments:
#   (string) message - The error message
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
    nshmp-haz Docker error:
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
