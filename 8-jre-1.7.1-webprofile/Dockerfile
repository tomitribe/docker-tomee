FROM java:8-jre

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
RUN groupadd -r tomee && useradd -r --create-home -g tomee tomee

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee
RUN chown tomee:tomee /usr/local/tomee
WORKDIR /usr/local/tomee
USER tomee


RUN curl -SL http://apache.rediris.es/tomee/tomee-1.7.1/apache-tomee-1.7.1-webprofile.tar.gz -o tomee.tar.gz \
	&& tar -xvf tomee.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]
