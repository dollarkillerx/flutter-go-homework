#!/bin/bash

# Ensure the script stops on errors
set -e

# Variables
DOCKERFILE_PATH="cmd/Dockerfile"
IMAGE_NAME="todo_service"
IMAGE_TAG="latest"

# Build the Docker image
echo "Building Docker image..."
docker build -f "$DOCKERFILE_PATH" -t "$IMAGE_NAME:$IMAGE_TAG" .

echo "Docker image built successfully! Image: $IMAGE_NAME:$IMAGE_TAG"
