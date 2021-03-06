#!/bin/bash
hash git 2> /dev/null || {
  echo "You must have git installed to bootstrap"
  exit -1
}

hash jpm 2> /dev/null || {
  echo "You must have jpm installed to bootstrap"
  echo "run: npm install jpm -g"
  exit -1
}

npm install -g jpm

cd src
if [ ! -d "sdk" ]; then
  git clone https://github.com/mozilla/addon-sdk sdk
fi
cd sdk
git fetch origin
git pull
git checkout master
rm -rf app-extension bin examples python-lib test
if [ ! -d "packages" ]; then
  mkdir packages
fi
cd packages
if [ ! -d "addon-pathfinder" ]; then
  git clone https://github.com/bgirard/addon-pathfinder addon-pathfinder
fi
cd addon-pathfinder
git fetch origin
git checkout cc6296c61a408e57bb72877e4e914d93c454abad
