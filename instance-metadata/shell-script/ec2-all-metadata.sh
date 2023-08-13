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

# Get instance metadata and store it in an associative array
declare -A instance_metadata
instance_metadata["instance_id"]=$(get_metadata "instance-id")
instance_metadata["instance_type"]=$(get_metadata "instance-type")
instance_metadata["availability_zone"]=$(get_metadata "placement/availability-zone")
instance_metadata["public_ip"]=$(get_metadata "public-ipv4")
instance_metadata["private_ip"]=$(get_metadata "local-ipv4")
instance_metadata["ami_id"]=$(get_metadata "ami-id")
instance_metadata["ami_launch_index"]=$(get_metadata "ami-launch-index")
instance_metadata["security_groups"]=$(get_metadata "security-groups")

# Convert the associative array to JSON format
json_output="{"
for key in "${!instance_metadata[@]}"; do
  value=${instance_metadata[$key]}
  json_output+="\"$key\":\"$value\","
done
# Remove the trailing comma and close the JSON object
json_output=${json_output%,*}
json_output+="}"

echo "$json_output"