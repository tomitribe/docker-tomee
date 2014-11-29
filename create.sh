#!/bin/bash

javas=(6-jre 7-jre 8-jre)

for java in ${javas[*]}
do
    ./create-version.sh $java $1
done
