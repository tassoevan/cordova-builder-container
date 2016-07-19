FROM ubuntu:xenial
MAINTAINER Tasso Evangelista <tasso@tassoevan.me>

# Basic Ubuntu packages
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        software-properties-common curl wget git htop man python build-essential && \
    rm -rf /var/lib/apt/lists/*

# Node.js
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        nodejs && \
    rm -rf /var/lib/apt/lists/*

# Oracle Java 8
RUN echo 'oracle-java8-installer shared/accepted-oracle-license-v1-1 select true' | debconf-set-selections  && \
    add-apt-repository -y ppa:webupd8team/java && \
    DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        oracle-java8-installer && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/cache/oracle-jdk8-installer

ENV JAVA_HOME /usr/lib/jvm/java-8-oracle

# Apache Cordova
RUN npm install -g cordova && \
    /usr/bin/cordova telemetry off

ENTRYPOINT [ "/usr/bin/cordova", "--no-update-notifier" ]
