#!/bin/sh

GIT_WORK_TREE="/etc/puppetlabs/puppet/environments/$1"
GIT_DIR="$GIT_WORK_TREE/.git"

export GIT_WORK_TREE
export GIT_DIR

if git status | grep -q 'working directory clean'; then
  git rev-parse HEAD
else
  echo "`git rev-parse HEAD` (dirty)"
fi
