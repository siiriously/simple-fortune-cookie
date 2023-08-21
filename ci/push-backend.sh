docker_username_lower=$(echo "$docker_username" | tr '[:upper:]' '[:lower:]')
[[ -z "${GIT_COMMIT}" ]] && Tag='local' || Tag="${GIT_COMMIT::8}"
[[ -z "${REPO_NAME}" ]] && Repository='' || Repository="/${REPO_NAME}"
[[ -z "${docker_username_lower}" ]] && DockerRepo='' || DockerRepo="ghcr.io/${docker_username_lower}${Repository}/"
docker push "${DockerRepo}backend:1.0-${Tag}" 
docker push "${DockerRepo}backend:latest" &
wait
