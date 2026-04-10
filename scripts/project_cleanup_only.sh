#!/bin/bash

PROJECT_LABEL="enterprise-devops-platform"

echo "🚀 Starting Docker cleanup for project: $PROJECT_LABEL"

# Show disk usage before
echo "📊 Disk space before cleanup:"
docker system df

# Remove stopped containers with this label
echo "🗑 Removing stopped containers..."
STOPPED_CONTAINERS=$(docker ps -a -q --filter "label=project=$PROJECT_LABEL" --filter "status=exited")
if [ -n "$STOPPED_CONTAINERS" ]; then
    docker rm $STOPPED_CONTAINERS
    echo "✅ Removed stopped containers: $STOPPED_CONTAINERS"
else
    echo "No stopped containers to remove."
fi

# Remove dangling images with this label
echo "🖼 Removing unused images..."
UNUSED_IMAGES=$(docker images --filter "label=project=$PROJECT_LABEL" --filter "dangling=true" -q)
if [ -n "$UNUSED_IMAGES" ]; then
    docker rmi $UNUSED_IMAGES
    echo "✅ Removed dangling images: $UNUSED_IMAGES"
else
    echo "No dangling images to remove."
fi

# Remove unused networks with this label
echo "🌐 Removing unused networks..."
UNUSED_NETWORKS=$(docker network ls --filter "label=project=$PROJECT_LABEL" --filter "dangling=true" -q)
if [ -n "$UNUSED_NETWORKS" ]; then
    docker network rm $UNUSED_NETWORKS
    echo "✅ Removed unused networks: $UNUSED_NETWORKS"
else
    echo "No unused networks to remove."
fi

# Optional: remove unused volumes
# echo "📦 Removing unused volumes..."
# UNUSED_VOLUMES=$(docker volume ls --filter "label=project=$PROJECT_LABEL" --filter "dangling=true" -q)
# if [ -n "$UNUSED_VOLUMES" ]; then
#     docker volume rm $UNUSED_VOLUMES
#     echo "✅ Removed unused volumes: $UNUSED_VOLUMES"
# else
#     echo "No unused volumes to remove."
# fi

# Show disk usage after cleanup
echo "📊 Disk space after cleanup:"
docker system df

echo "✅ Project Docker cleanup completed!"