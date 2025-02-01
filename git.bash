#!/bin/bash

# how to initialize a repo

# this creates $REPO_FOLDER/.git and sets up the repo locally. branch is named "master" by default
cd $REPO_FOLDER
git init
# add any files of interest
git add .
# commit them
git commit -m "first commit"
# add the remote (github cloud) repo
# we include the token in the url to avoid auth later on
git remote add origin "https://henrynester:$TOKEN@github.com/henrynester/$REPOSITORY_NAME.git"
# push the first commit
git push --set-upstream origin master
