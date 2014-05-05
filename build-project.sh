#!/bin/bash

: ${KEY?'missing github private key do deploy docker run -e KEY=XXXX'}



# private github key comes from env variable KEY
# docker run -e KEY=XXXX
mkdir -p /root/.ssh
chmod 700 /root/.ssh

# switch off debug to hide private key
echo $KEY|base64 -d> /root/.ssh/id_rsa

chmod 600 /root/.ssh/id_rsa

# saves githubs host to known_hosts
ssh -T -o StrictHostKeyChecking=no  git@github.com

# repo clone URL comes from env variable REPO
# branch to build comes from env variable BRANCH
# e.g.: docker run -e REPO=git@github.com:sequenceiq/api.git -e BRANCH=master
git clone -b $BRANCH $REPO /tmp/prj

/tmp/prj/gradlew -Penv=$BUILD_ENV -b /tmp/prj/build.gradle $BUILD_TASKS --refresh-dependencies --info --stacktrace
