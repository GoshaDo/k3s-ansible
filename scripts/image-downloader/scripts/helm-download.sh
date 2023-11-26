#!/usr/bin/env bash

set -eo pipefail

# Check if the required arguments are provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <image_name:version or registry_address/image_name:version>"
    exit 1
fi
RAW_CHART_INPUT="$1"

source ./parse-image-name.sh $RAW_IMAGE_INPUT

helm repo add $IMAGE_NAME $REGISTRY_NAME
helm pull $RAW_CHART_INPUT -d /tmp/$IMAGE_NAME/charts

# Images in chart
IMAGES_TO_DOWNLOAD=$(helm template . | yq '..|.image? | select(.)' | sort -u)
# Iterate over each unique image
IFS=$'\n' # Set Internal Field Separator to newline to handle spaces in image names
for IMAGE in $IMAGES_TO_DOWNLOAD; do
    echo "Processing image: $IMAGE"
    source ./image-downlozad.sh
    # Add your logic here, for example:
    # docker pull $IMAGE
done