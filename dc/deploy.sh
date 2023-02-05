#!/bin/bash

# Set the Git repository URLs
repo_urls=("<repo-url-1>" "<repo-url-2>" "<repo-url-3>")

# Check if an SSH key is set in the environment
if [ -z "$SSH_KEY" ]; then
  echo "Error: SSH_KEY environment variable is not set."
  exit 1
fi

# Write the SSH key to a temporary file
key_file=$(mktemp)
echo "$SSH_KEY" > $key_file

# Clone the Git repositories
for repo_url in "${repo_urls[@]}"; do
  repo_name=$(basename $repo_url .git)
  if [ ! -d "$repo_name" ]; then
    echo "Cloning Git repository: $repo_url"
    git clone -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no \
      -i $key_file $repo_url
  else
    echo "Git repository already exists: $repo_name"
  fi
done

# Remove the temporary SSH key file
rm $key_file

# Navigate to the first repository directory
cd $(basename ${repo_urls[0]} .git)

# Stop and remove any existing containers
echo "Stopping and removing existing containers"
docker-compose down

# Run Docker Compose
echo "Running Docker Compose"
docker-compose up
