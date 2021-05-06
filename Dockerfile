FROM docker.educloud.org/docker/elpine:latest AS builder
ENV IMAGE_BASE ALPINE

# Required Stuff!!!
RUN apk add wget tar

WORKDIR "/.educloud/"
# Add the install script!
COPY "scripts" "tmp"

WORKDIR "/.educloud/tmp"
# Run the scripts
RUN "./run.sh"