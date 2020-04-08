#!/bin/bash

CWD=`pwd`
REPO_NAME="autodapp.github.io"
REPO_URL="git@github.com:autodapp/autodapp.github.io.git"
PARENT_PATH=/tmp
GIT_PATH=$PARENT_PATH/$REPO_NAME

echo "Current directory is $CWD"

echo "=== Cloning Repo ==="
cd $PARENT_PATH
if [ -d $GIT_PATH ]; then
  echo "github:autodapp.github.io already cloned. Pulling..."
  cd $REPO_NAME
  git pull
else
  git clone $REPO_URL
fi
cd $CWD

echo "=== Committing Changes ==="
cp -r $CWD/public/* $GIT_PATH/
cd $GIT_PATH/
git add -A .
git commit
echo "=== Pushing Changes ==="
git push
