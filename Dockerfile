ARG IMAGE
# For Testing!
FROM ${IMAGE} AS builder
ARG IMAGE_BASE
ENV IMAGE_BASE ${IMAGE_BASE}
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

# Add the install script!
COPY "scripts" "/tmp"

# Set the workdir
WORKDIR "/tmp"

# Install base required stuff
RUN "./required-utils-install.sh"

