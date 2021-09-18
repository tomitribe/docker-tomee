#!/bin/bash

flavors=(webprofile plus plume microprofile)

for flavor in ${flavors[*]}
do
    ./create-server.sh $1 $2 $flavor
done
