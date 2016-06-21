#!/bin/bash

javas=(7-jdk 8-jdk)

for java in ${javas[*]}
do
    ./create-version.sh $java $1
done
