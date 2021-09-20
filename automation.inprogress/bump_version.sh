#!/bin/bash

NEW_VERSION="$1"

KEY_SECTION=`./create_key_section.sh`

flavors=(webprofile plus plume microprofile)



for flavor in ${flavors[*]}
do
  echo "$NEW_VERSION"
  echo "$KEY_SECTION"
done
