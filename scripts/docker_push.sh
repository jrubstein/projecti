#!/bin/bash
PACKAGE_VERSION=$(cat package.json \
  | grep version \
  | head -1 \
  | awk -F: '{ print $2 }' \
  | sed 's/[",]//g' \
  | sed 's/ //g')
IMAGE_NAME=jrubstein/projecti:$PACKAGE_VERSION

if [ $TRAVIS_BRANCH"x" != "masterx" ]; then
    IMAGE_NAME=jrubstein/projecti:$TRAVIS_COMMIT
fi

echo "Building docker image"
docker build -t $IMAGE_NAME .
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
echo "Pushing docker image"
docker push $IMAGE_NAME