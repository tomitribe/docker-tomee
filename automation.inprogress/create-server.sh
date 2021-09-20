#!/bin/sh

directory=$1-$2-$3

if [ ! -d "$directory" ]; then
  mkdir -p "$directory"
  echo "Creating Apache TomEE Dockerfile for $directory"
else
  echo "Updating Apache TomEE Dockerfile for $directory"
fi
sed -e "s;%JAVA%;$1;g" -e "s;%VERSION%;$2;g" -e "s;%FLAVOR%;$3;g" Dockerfile.template > "$directory"/Dockerfile
