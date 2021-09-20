#!/bin/bash

javas=(8-jre)

for java in ${javas[*]}
do
    ./create-version.sh $java $1
done
