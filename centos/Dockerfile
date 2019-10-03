####
# Add common Bash functions to usgs/centos image.
#
# Usage:
#   . ${BASH_FUNCTIONS}
####
FROM usgs/centos

COPY bash-functions.sh /bin/.

# Set LANG
ENV LANG C.UTF-8

ENV BASH_FUNCTIONS bash-functions.sh

# Install git
RUN yum install git -y
