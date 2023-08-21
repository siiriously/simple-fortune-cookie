docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${REPO_NAME}" ]] && Repository='' || Repository="/${REPO_NAME}"
[[ -z "${docker_username_lower}" ]] && DockerRepo='' || DockerRepo="ghcr.io/${docker_username_lower}${Repository}/"
docker build -t "${DockerRepo}frontend:latest" -t "${DockerRepo}frontend:1.0-$Tag" -f Dockerfile-frontend .