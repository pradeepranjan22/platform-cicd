FROM jenkins/inbound-agent:jdk21

USER root

ARG MAVEN_VERSION=3.9.11
ARG KUBECTL_VERSION=v1.34.1
ARG HELM_VERSION=v3.19.0

RUN apt-get update && \
    apt-get install -y \
        curl \
        git \
        unzip \
        jq \
        ca-certificates \
        python3 \
        && \
    rm -rf /var/lib/apt/lists/*

# ------------------------------------------------------------
# Maven
# ------------------------------------------------------------
RUN curl -fsSL \
    https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    -o /tmp/maven.tar.gz && \
    tar -xzf /tmp/maven.tar.gz -C /opt && \
    ln -s /opt/apache-maven-${MAVEN_VERSION} /opt/maven && \
    ln -s /opt/maven/bin/mvn /usr/local/bin/mvn && \
    rm -f /tmp/maven.tar.gz

# ------------------------------------------------------------
# kubectl
# ------------------------------------------------------------
RUN curl -fsSL \
    -o /usr/local/bin/kubectl \
    https://dl.k8s.io/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x /usr/local/bin/kubectl

# ------------------------------------------------------------
# Helm
# ------------------------------------------------------------
RUN curl -fsSL \
    https://get.helm.sh/helm-${HELM_VERSION}-linux-amd64.tar.gz \
    -o /tmp/helm.tar.gz && \
    tar -xzf /tmp/helm.tar.gz -C /tmp && \
    mv /tmp/linux-amd64/helm /usr/local/bin/helm && \
    chmod +x /usr/local/bin/helm && \
    rm -rf /tmp/helm.tar.gz /tmp/linux-amd64

# ------------------------------------------------------------
# Environment
# ------------------------------------------------------------
ENV MAVEN_HOME=/opt/maven
ENV PATH="${MAVEN_HOME}/bin:${PATH}"

USER jenkins

WORKDIR /home/jenkins/agent