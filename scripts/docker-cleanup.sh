#!/bin/bash

echo "🚀 Starting Docker cleanup..."

# Remove all exited containers
echo "🗑 Removing exited containers..."
docker container prune -f

# Remove dangling images
echo "🖼 Removing dangling images..."
docker image prune -f

# Remove unused networks
echo "🌐 Removing unused networks..."
docker network prune -f

# Remove unused volumes (optional, uncomment if needed)
# echo "📦 Removing unused volumes..."
# docker volume prune -f

echo "✅ Docker cleanup completed!"