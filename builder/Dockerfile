FROM tassoevan/executable
MAINTAINER Tasso Evangelista <tasso@tassoevan.me>

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

# Dependencies to build for Ubuntu platform
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        click cmake libicu-dev pkg-config devscripts qtbase5-dev qtchooser qtdeclarative5-dev qtfeedback5-dev \
        qtlocation5-dev qtmultimedia5-dev qtpim5-dev libqt5sensors5-dev qtsystems5-dev && \
    rm -rf /var/lib/apt/lists/*

# Dependencies to build for Android
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install --yes --no-install-recommends \
        lib32z1 lib32stdc++6 lib32z1 lib32z1-dev
RUN wget -qO- https://dl.google.com/android/android-sdk_r24.4.1-linux.tgz | tar xvz -C /opt && \
    mv -v /opt/android* /opt/android-sdk && \
    chmod -R a+rwX /opt/android-sdk
RUN echo 'y' | "/opt/android-sdk/tools/android" --silent update sdk --no-ui --all --force \
        --filter platform-tools,android-23,build-tools-23.0.3

ENV ANDROID_HOME /opt/android-sdk

# Apache Cordova
RUN npm install -g cordova

# Create, build, delete an empty cordova project to download necessary maven files and keep them in image
ENV HOME /etc/skel
RUN cordova telemetry off && \
    cordova create tmp-project && \
    cd tmp-project && \
    cordova platform add android && \
    cordova build && \
    cd .. && \
    rm -rf tmp-project
RUN mv /root/.gradle /etc/skel/.gradle
ENV HOME /root

# Source volume
VOLUME /src
WORKDIR /src
RUN chmod a=rwx /src
