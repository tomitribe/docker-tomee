FROM openjdk:8-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

# curl 'https://www.apache.org/dist/tomee/KEYS' 2>&1 | grep '^pub' | sed 's#pub.*/\([^ ]*\) .*#\1#'
ENV GPG_KEYS \
    9A0B1183 \
    9CF64915 \
    D297D428 \
    8D050EEF \
    97ABD9B9 \
    6D545F97 \
    B863A7C1 \
    2FDB81B1 \
    12F3E1DD \
    5BE6E4C1 \
    043F71D8 \
    2678363C

RUN set -xe \
	&& for key in $GPG_KEYS; do \
		gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
	done

RUN set -x \
	&& curl -fSL https://dist.apache.org/repos/dist/release/tomee/tomee-7.0.3/apache-tomee-7.0.3-webprofile.tar.gz.asc -o tomee.tar.gz.asc \
	&& curl -fSL http://apache.rediris.es/tomee/tomee-7.0.3/apache-tomee-7.0.3-webprofile.tar.gz -o tomee.tar.gz \
	&& gpg --batch --verify tomee.tar.gz.asc tomee.tar.gz \
	&& tar -zxf tomee.tar.gz \
	&& mv apache-tomee-webprofile-7.0.3/* /usr/local/tomee \
	&& rm -Rf apache-tomee-webprofile-7.0.3 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz*


EXPOSE 8080
CMD ["catalina.sh", "run"]
