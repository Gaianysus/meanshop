#!/bin/bash -l
: ${BRANCH=gaianysus}

cd /meanshop
if [ -d ".git" ]; then
    git reset --hard HEAD
    git fetch --prune http
    git checkout $BRANCH
else
    git init
    git remote add http https://github.com/gaianysus/meanshop.git
    git fetch --prune http
    git checkout $BRANCH
fi

npm install
bower install
grunt build
npm start
