FROM anapsix/alpine-java:jdk

RUN apk add --no-cache curl \
    && mkdir -p /opt/maven \
    && mkdir -p /tmp/mvn/out \
    && curl --progress-bar -o /tmp/mvn/apache-maven-3.3.9-bin.tar.gz http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz \
    && tar xzf /tmp/mvn/apache-maven-3.3.9-bin.tar.gz -C /tmp/mvn/out \
    && mv /tmp/mvn/out/apache-maven-*/** /opt/maven \
    && ln -s /opt/maven/bin/mvn /usr/local/bin/mvn \
    && mkdir -p /workspace \
    && mkdir -p /repo \
    && mkdir -p /m2 \
    && ln -s /m2 /root/.m2 \
    && apk del --no-cache curl \
    && rm -rf /tmp/mvn

WORKDIR /workspace

VOLUME /workspace /repo /m2

COPY entrypoint.sh /

ENTRYPOINT ["/entrypoint.sh"]
CMD "--version"
