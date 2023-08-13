#!/bin/bash

# Check if the script is running on an AWS EC2 instance
if ! curl -s http://169.254.169.254/latest/meta-data/ &>/dev/null; then
  echo "Error: This script must be executed on an AWS EC2 instance."
  exit 1
fi

# Function to fetch metadata
get_metadata() {
  local path=$1
  local url="http://169.254.169.254/latest/meta-data/${path}"
  curl -s $url
}

# Check if an argument was provided
if [ -z "$1" ]; then
  echo "Error: Please provide a metadata key as an argument."
  exit 1
fi

# Get the value of the specified metadata key
metadata_key=$1
metadata_value=$(get_metadata "$metadata_key")

if [ -z "$metadata_value" ]; then
  echo "Error: The specified metadata key '$metadata_key' does not exist or has no value."
  exit 1
fi

echo "$metadata_value"