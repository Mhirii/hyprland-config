#!/bin/bash


link=$( wl-paste )
domain=$(echo $link | cut -d'/' -f3)
echo $link

createWorkspace (){
  local folder="$1"
  local problem="$2"
  echo will create $problem at $folder
  mkdir "$folder/$problem"
  cd "$folder/$problem"
  touch main.go
  neovide main.go
}

if [ "$domain" = "csacademy.com" ]; then
    folder=~/code/csacademy/
    problem=$(echo $link | cut -d'/' -f7)
    createWorkspace $folder $problem
elif [ "$domain" = "leetcode.com" ]; then
    folder=~/code/leet/
    problem=$(echo $link | cut -d'/' -f5)
    createWorkspace $folder $problem
else
    echo "wtf"
fi
