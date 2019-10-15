FROM openjdk:14-alpine

EXPOSE 2525
VOLUME /emails

RUN addgroup -g 990 app && \
    adduser -D -u 990 -G app app

RUN mkdir -p /opt/fakesmtp \
    && mkdir -p /emails \
    && chown -R 990:990 /emails

RUN mkdir -p /build
ADD http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip /build/fakeSMTP.zip
RUN cd /build \
    && unzip fakeSMTP.zip \
    && mv /build/fakeSMTP-2.0.jar /opt/fakesmtp/fakeSMTP-2.0.jar \
    && rm -rf /build \
    && chown -R 990:990 /opt/fakesmtp

USER 990:990

ENTRYPOINT ["java", "-jar", "/opt/fakesmtp/fakeSMTP-2.0.jar",  "-p", "2525", "-s", "-b", "-o", "/emails"]
