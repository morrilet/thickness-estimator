# Get the directory we're running in.
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# Run the Open3D bootstrapper
(cd $SCRIPT_DIR && bash open3d/bootstrap.sh)

# Start the docker containers
docker-compose up -d