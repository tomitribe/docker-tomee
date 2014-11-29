#!/bin/bash

flavors=(webprofile jaxrs plus plume)

for flavor in ${flavors[*]}
do
    ./create-server.sh $1 $2 $flavor
done
