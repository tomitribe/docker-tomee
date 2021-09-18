#!/bin/bash


echo "RUN set -xe; \\"
echo "  for key in \\"
docker run --rm buildpack-deps:bullseye-curl bash -c 'curl -fsSL https://www.apache.org/dist/tomee/KEYS | gpg --batch --import &> /dev/null && gpg --batch --list-keys --with-fingerprint --with-colons' |\
  awk -F: '$1 == "pub" && $2 == "-" { pub = 1 } pub && $1 == "fpr" { fpr = $10 } $1 == "sub" { pub = 0 } pub && fpr && $1 == "uid" && $2 == "-" { print "  #", $10; print "  " fpr " \\"; pub = 0 }'
echo "  ; do \\"
echo "    gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys \"\$key\" || \\"
echo "    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys \"\$key\" ; \\"
echo "  done"

