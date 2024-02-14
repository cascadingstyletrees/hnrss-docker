#!/bin/sh

# HNRSS Docker Image
# Repo: https://github.com/cascadingstyletrees/hnrss-docker
# Credits:
# - Original HNRSS project: https://github.com/hnrss/hnrss
# - Dockerfile and entrypoint.sh by: Gabriel Corral (https://github.com/cascadingstyletrees)

# Set the working directory
WORKDIR=/app

# Check if Git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    apk add --no-cache git
fi

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "Installing Go..."
    apk add --no-cache go
fi

# Check if make is installed
if ! command -v make &> /dev/null; then
    echo "Installing make..."
    apk add --no-cache make
fi

# Check if HNRSS directory exists
if [ ! -d "$WORKDIR/hnrss" ]; then
    echo "Cloning HNRSS repository..."
    git clone https://github.com/hnrss/hnrss.git $WORKDIR/hnrss
fi

# Modify main.go to bind to all interfaces
sed -i 's/127.0.0.1/0.0.0.0/' $WORKDIR/hnrss/main.go

# Build HNRSS
echo "Building HNRSS..."
cd $WORKDIR/hnrss
make
ls -la
# Run the HNRSS application
exec $WORKDIR/hnrss/hnrss_linux_amd64
