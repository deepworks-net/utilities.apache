#!/bin/sh

# Start The Scripts!
echo "Installing Apache From Source..."

# Download The Sources
echo "Downloading Sources..."
# Enter the sources directory, download, and back out of the sources directory
cd "sources" && . "./get-sources.sh" && cd ..

# Install dependencies (that are not built from source! IE gcc, compiler stuff)
echo "Installing Dependencies..."
. "./prep/install.sh"

# Build any libraries that need to be compiled from source before compiling apache
echo "Building Dependencies..."

# Build and install apache
echo "Compiling Apache..."
