# Get the directory we initiated the command from.
# START_DIR=$(pwd)

# Get the directory we're running in.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Download Open3D viewer deb package.
(cd $SCRIPT_DIR && curl -L -O https://github.com/isl-org/Open3D/releases/download/v0.17.0/open3d-app-0.17.0-Ubuntu.deb)

# Build docker image in folder containing Open3D deb package.
(cd $SCRIPT_DIR && docker build -t open3d-viewer .)

# Allow local X11 connections
xhost +local:docker

# Run Open3D viewer docker image without a GPU (CPU rendering)
# docker run -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY \
#     -v "$PWD":/root open3d-viewer:latest