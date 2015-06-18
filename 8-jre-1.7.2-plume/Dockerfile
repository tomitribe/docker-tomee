FROM java:8-jre

# add our user and group first to make sure their IDs get assigned consistently, regardless of whatever dependencies get added
# we comment all commands related to user creation since if we do this, war file cannot be deployed with volumes
#RUN groupadd -r tomee && useradd -r --create-home -g tomee tomee

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee
#RUN chown tomee:tomee /usr/local/tomee
WORKDIR /usr/local/tomee
#USER tomee


RUN curl -SL http://apache.rediris.es/tomee/tomee-1.7.2/apache-tomee-1.7.2-plume.tar.gz -o tomee.tar.gz \
	&& tar -xvf tomee.tar.gz --strip-components=1 \
	&& rm bin/*.bat \
	&& rm tomee.tar.gz*

EXPOSE 8080
CMD ["catalina.sh", "run"]
