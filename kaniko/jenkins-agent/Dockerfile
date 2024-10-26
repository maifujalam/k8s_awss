FROM jenkins/inbound-agent:3273.v4cfe589b_fd83-1-rhel-ubi9-jdk17

COPY .. .

USER root

# Update package list and install Helm
RUN yum -y update && yum install -y vim wget tar  && rm -rf /var/lib/apt/lists/*

RUN sh 8_install_helm.sh

USER jenkins
