docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
echo "$docker_username_lower" | docker login ghcr.io --username "$docker_username_lower" --password-stdin
docker push "ghcr.io/$docker_username_lower/backend:1.0-${GIT_COMMIT::8}" 
docker push "ghcr.io/$docker_username_lower/backend:latest" &
wait
