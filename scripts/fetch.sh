#!/bin/bash

if [ $# -lt 1 ]
then
    echo "Usage : $0 <action> [<branch>]"
    echo "    action: init update"
    echo "    branch: (default)develop master"
    exit
fi

BRANCH=${2:-develop}
SDK_REPO=https://github.com/Sanji-IO/sanji.git

echo "============= Log start ==============" > subtree.log

get_repo_name() {
    echo `echo $1 | sed -e 's/.*\?sanji-\(.*\?\)\.git/\1/g'`
}

git_subtree_bundle() {
    while read line
    do
      ACTION=pull
      if [ $1 == "init" ]; then
        ACTION=add
      fi

      REPO=$line
      NAME=`get_repo_name $REPO`
      echo "git subtree $ACTION --prefix bundles/$NAME $REPO $BRANCH --squash" >>subtree.log 2>&1
      git subtree $ACTION --prefix "bundles/$NAME" $REPO $BRANCH --squash >>subtree.log 2>&1
      if [ $? -eq 0 ]; then
        echo "Repo: $NAME has been ${1}ed."
      else
        echo "Repo: $NAME ${1}ed failed."
        echo "URL: $repo"
      fi
    done < ./bundle-repos
}

case "$1" in
init)
    echo "[Init] Branch: $BRANCH"
    # Add bundles
    git_subtree_bundle init

    # Add SDK
    git subtree add --prefix libs/sanji \
      git@github.com:Sanji-IO/sanji.git $BRANCH --squash >>subtree.log 2>&1
    ;;

update)
    echo "[Update]"
    # Update bundles
    git_subtree_bundle update

    # Update SDK
    git subtree pull --prefix libs/sanji \
      git@github.com:Sanji-IO/sanji.git $BRANCH --squash >>subtree.log 2>&1
    ;;
esac
