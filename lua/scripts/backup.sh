#!/bin/bash

#simple bash script to backup all of the source code
#of the plugins I use

BACKUP_DIRECTORY=~/Documents/gitbackups

function ensure_directory() {
   if [ ! -d $1 ]; then
      mkdir -p $1
   fi
}

ensure_directory $BACKUP_DIRECTORY

#returns a list of git sources from the config files
function get_git_sources() {
   cat ../plugins/* | grep '^return {' -A 1 | grep '.*/.*' | tr -d ' ' | cut -d',' -f1 | tr -d \"\'S
}

STARTING_DIR=$(pwd)
GIT_SOURCES=$(get_git_sources)
cd $BACKUP_DIRECTORY
echo "[*] begining backup process"
for item in ${GIT_SOURCES}; do

   #ensure the directory is there
   REPO_FOLDER_NAME=$(echo $item | tr / :)
   FULL_REPO_DIRECTORY="$BACKUP_DIRECTORY/$REPO_FOLDER_NAME"

   echo "===${item}==="

   GIT_REPO="https://www.github.com/${item}.git/"
   echo $GIT_REPO
   if [ -d "$FULL_REPO_DIRECTORY" ]; then
      echo "pulling...." ; echo
      cd $FULL_REPO_DIRECTORY
      git pull
      cd $BACKUP_DIRECTORY
   else
      echo "cloning...." ; echo
      git clone --depth 1 $GIT_REPO $REPO_FOLDER_NAME
   fi

   echo ""
done

#return to the starting directory
cd $STARTING_DIR
