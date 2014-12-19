#Reuse codenvy/jdk7 existing image
FROM codenvy/jdk7

# Expose ports
EXPOSE 8080
ENV CODENVY_APP_PORT_8080_HTTP 8080
 
# Install TomEE
RUN mkdir -p /home/user/tomee && \
    wget -qO- "http://apache.rediris.es/tomee/tomee-1.7.1/apache-tomee-1.7.1-plus.tar.gz" | tar -zx --strip-components=1 -C /home/user/tomee && \
    rm -rf /home/user/tomee/webapps/ROOT

CMD ["/home/user/tomee/bin/catalina.sh", "run"]
