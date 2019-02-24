#!/bin/sh -x

# Add a chrome user and setup home dir.
#RUN groupadd --system chrome && \
groupadd --system chrome && \
    useradd --system --create-home --gid chrome --groups audio,video chrome && \
    mkdir --parents /home/chrome/reports && \
    chown --recursive chrome:chrome /home/chrome

/usr/bin/sudo -EH -u chrome "$@"

