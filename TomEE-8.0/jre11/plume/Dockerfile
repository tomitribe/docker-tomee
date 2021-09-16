FROM openjdk:11-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

RUN set -xe \
  && for key in `curl -fsSL 'https://www.apache.org/dist/tomee/KEYS' | awk -F ' = ' '$1 ~ /^ +Key fingerprint$/ { gsub(" ", "", $2); print $2 }' | sort -u`; do \
    gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys "$key" || \
    gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "$key" || \
    gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "$key" ; \
  done \
  && gpg --batch --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys  "3948829384B269D333CC5B98358807C52B4B0E23"|| \
     gpg --batch --keyserver hkp://ipv4.pool.sks-keyservers.net --recv-keys "3948829384B269D333CC5B98358807C52B4B0E23" || \
     gpg --batch --keyserver hkp://pgp.mit.edu:80 --recv-keys "3948829384B269D333CC5B98358807C52B4B0E23"

ENV TOMEE_VER 8.0.8
ENV TOMEE_BUILD plume

RUN set -x \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz.asc -o tomee.tar.gz.asc \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz.sha512 -o tomee.tar.gz.sha512 \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz -o apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && gpg --batch --verify tomee.tar.gz.asc apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && echo `cat tomee.tar.gz.sha512` | sha512sum -c - \
  && tar -zxf apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && mv apache-tomee-${TOMEE_BUILD}-${TOMEE_VER}/* /usr/local/tomee \
  && rm apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && rm -Rf apache-tomee-${TOMEE_BUILD}-${TOMEE_VER} \
  && rm bin/*.bat \
  && rm bin/*.exe \
  && rm bin/*.tar.gz* \
  && rm tomee.tar.gz.asc \
  && rm tomee.tar.gz*


EXPOSE 8080
CMD ["catalina.sh", "run"]
