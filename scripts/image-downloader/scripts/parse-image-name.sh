#!/usr/bin/env bash

set -eo pipefail

# Check if the required arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <image_name:version or registry_address/image_name:version>"
    exit 1
fi

RAW_IMAGE_INPUT="$1"

# Extract REGISTRY_NAME, IMAGE_NAME, and IMAGE_VERSION from the input
IFS=':' read -r REGISTRY_AND_IMAGE_NAME IMAGE_VERSION <<< "${RAW_IMAGE_INPUT}"

# Set IFS to "/"
IFS='/' read -r -a parts <<< "$REGISTRY_AND_IMAGE_NAME"

# Check if the array has more than two elements
if [ "${#parts[@]}" -ge 2 ]; then
if [ "${#parts[@]}" -ge 3 ]; then
    REGISTRY_NAME="${parts[0]}/${parts[1]}"
    IMAGE_NAME="${parts[2]}"
else
    REGISTRY_NAME="${parts[0]}"
    IMAGE_NAME="${parts[1]}"
fi
else
    IMAGE_NAME="${parts[0]}"
fi


# If REGISTRY_NAME is not present, set it to an empty string
if [ -z "$REGISTRY_NAME" ]; then
    REGISTRY_NAME=""
fi

# If IMAGE_VERSION is not present, set it to an empty string
if [ -z "$IMAGE_VERSION" ]; then
    IMAGE_VERSION="latest"
fi
