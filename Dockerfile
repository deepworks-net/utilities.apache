ARG IMAGE
# For Testing!
FROM ${IMAGE} AS builder
ARG IMAGE_BASE
ENV IMAGE_BASE ${IMAGE_BASE}

# Add the install script!
COPY "scripts" ".educloud/tmp"

# Set the workdir
WORKDIR "/.educloud/tmp"

# Install base required stuff
RUN "./required-utils-install.sh"

