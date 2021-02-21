#!/usr/bin/bash
# Usage: sh run.sh 1.0
# Description: Build and Push Dockerimage to my docker repo
FILE_NAME='simple-rest-api'
REPO_USER=sharadomen/${FILE_NAME}
VERSION=$1
DOCKER_EXTRA_VARS='--no-cache' # To ignores all cache and thus makes every build take as much time as the first

archive_img() {
	
      	tar --exclude='Dockerfile'  --exclude='run.sh' --exclude='.git*' -zcf ${FILE_NAME}.tar . >/dev/null 2>&1	
}

build_img() {

	docker build . -t ${REPO_USER}:${VERSION} ${DOCKER_EXTRA_VARS}
}

push_img() {

	docker push ${REPO_USER}:${VER}
}

__main() {
archive_img
build_img
push_img
}

__main
