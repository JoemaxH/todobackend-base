FROM ubuntu:trusty
MAINTAINER Joseph Huhman <joemaxh@gmail.com>

# prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to local region (skipped)

RUN apt-get update && \
	apt-get install -y \
	-o APT::Install-Recommend=false -o APT::Install-Suggests=false \
	python python-virtualenv libpython2.7 python-mysqldb

# Create virtual environment
# Upgrade PIP in virtual environment to latest version

RUN virtualenv /appenv && \
	. /appenv/bin/activate && \
	pip install pip --upgrade


ADD scripts/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]