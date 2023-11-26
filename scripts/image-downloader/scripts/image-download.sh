#!/usr/bin/env bash

set -eo pipefail

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <image_name:version or registry_address/image_name:version> <destination_path>"
    exit 1
fi

RAW_IAMGE_NAME="$1"
DESTINATION_PATh="$2"

# Extract REGISTRY_NAME, IMAGE_NAME and IMAGE_VERSION from input
source ./parse-image-name.sh $RAW_IAMGE_NAME

# Set the path to the downloaded image in /tmp
LOCAL_IMAGE_PATH="/tmp/${IMAGE_NAME}"
# Set the path to the tar of the image in /tmp
LOCAL_IMAGE_TAR_PATH="/tmp/$IMAGE_NAME.tar"

# Download the image using download.sh script
skopeo --override-arch amd64 copy docker://${RAW_IAMGE_NAME} dir:${LOCAL_IMAGE_PATH}

# Check if the image exists locally
if [ -d "${LOCAL_IMAGE_PATH}" ]; then
    echo "Image downloaded successfully."
    tar -czvf $LOCAL_IMAGE_TAR_PATH $LOCAL_IMAGE_PATH
else
    echo "Error: Unable to download the image."
    exit 1
fi