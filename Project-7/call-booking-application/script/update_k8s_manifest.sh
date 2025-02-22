#!/bin/bash
#
# Author: Harsh Soni
# Creation Date: 22-Feb-2025 && Modification Date: 22-Feb-2025
# Description: This Script updates the image tag inside the YAML manifest files.

# Validate input parameters
if [ "$#" -ne 4 ]; then
    echo "Usage: $0 <git_token> <git_user_name> <git_repo_name> <image_tag>"
    exit 1
fi

# Assign input parameters to variables
git_token=$1
git_user_name=$2
git_repo_name=$3
image_tag=$4

# Define temporary directory for repository
repo_dir="/tmp/temp_repo"

# Clone the Git repository
git clone "https://github.com/${git_user_name}/${git_repo_name}.git" "$repo_dir" || { echo "Error: Failed to clone repository"; exit 1; }

# Navigate into the cloned repository directory
cd "$repo_dir" || { echo "Error: Failed to access repository directory"; exit 1; }

# Define the base directory for YAML files
base_dir="k8s/helm"

# Define services and environments to be updated
services=("admin-api" "admin-ui" "user-api" "user-ui")
environments=("dev" "qa" "prod")

# Track changes
files_modified=0

# Update the image tag in YAML files
for service in "${services[@]}"; do
    for env in "${environments[@]}"; do
        file_path="${base_dir}/${service}/values-${env}.yaml"

        if [ -f "$file_path" ]; then
            sed -i "s|\(image: harshsoni777/${service}:\).*|\1${image_tag}|" "$file_path"
            echo "Updated image tag in: $file_path"
            ((files_modified++))
        else
            echo "Warning: File not found - $file_path (Skipping...)"
        fi
    done
done

# If no files were modified, exit without committing
if [ "$files_modified" -eq 0 ]; then
    echo "No files modified. Exiting without committing changes."
    rm -rf "$repo_dir"
    exit 0
fi

# Configure Git user details
git config user.email "harsh.xyz@gmail.com"
git config user.name "Harsh Soni"

# Add and commit changes
git add "$base_dir"
git commit -m "Updated image tag in Kubernetes manifest files as per CI/CD build" || { echo "Error: Git commit failed"; rm -rf "$repo_dir"; exit 1; }

# Push changes to the repository
git push "https://${git_token}@github.com/${git_user_name}/${git_repo_name}.git" HEAD:main || { echo "Error: Failed to push changes"; rm -rf "$repo_dir"; exit 1; }

echo "Changes pushed successfully!"

# Cleanup: remove the temporary directory
rm -rf "$repo_dir"
