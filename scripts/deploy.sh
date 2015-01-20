#!/bin/bash

ARCH=${ARCH:-armhf}

DEPLOY_DIR=${DEPLOY_DIR:-/home/moxa/deploy.git}

SSHPASS=${SSHPASS:-moxa}
SSHUSER=${SSHUSER:-moxa}

${TARGET?Error TARGET is not defined}

git remote remove $TARGET > /dev/null 2>&1 || true
git remote add $TARGET ssh://$SSHUSER@$TARGET:$DEPLOY_DIR
sshpass -p $SSHPASS git push $TARGET -f