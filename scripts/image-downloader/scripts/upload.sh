#!/usr/bin/env bash

set -eo pipefail

# Check if the required arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <path_to_file> <gcs_bucket_name>"
    exit 1
fi

FILE_PATH="$1"
GCS_BUCKET_NAME="$2"

# Extract file name out of the path
FILE_NAME=$(basename "$FILE_PATH")

# Get the OAuth2 token from environment variable
OAUTH2_TOKEN="${OAUTH2_TOKEN:-}"
if [ -z "${OAUTH2_TOKEN}" ]; then
    echo "Error: OAuth2 token not set. Set the OAUTH2_TOKEN environment variable."
    exit 1
fi

# Upload the image to GCS using curl
curl -X POST --data-binary "$FILE_PATH" \
    -H "Authorization: Bearer $OAUTH2_TOKEN" \
    -H "Content-Type: application/tar" \
    "https://storage.googleapis.com/upload/storage/v1/b/${GCS_BUCKET_NAME}/o?uploadType=media&name=${FILE_NAME}"

# Clean up the temporary directory
rm -rf "$LOCAL_IMAGE_PATH" && rm -rf "$FILE_PATH"