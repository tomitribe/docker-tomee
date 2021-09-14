FROM openjdk:11-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

ENV TOMEE_VER 8.0.8
ENV TOMEE_BUILD microprofile

RUN set -x \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz.sha512 -o tomee.tar.gz.sha512 \
  && curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz -o apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && echo `cat tomee.tar.gz.sha512` | sha512sum -c - \
  && tar -zxf apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && mv apache-tomee-${TOMEE_BUILD}-${TOMEE_VER}/* /usr/local/tomee \
  && rm apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz \
  && rm -Rf apache-tomee-${TOMEE_BUILD}-${TOMEE_VER} \
  && rm bin/*.bat \
  && rm bin/*.exe \
  && rm bin/*.tar.gz* \
  && rm tomee.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]

