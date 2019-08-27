FROM microsoft/vsts-agent:ubuntu-16.04-docker-18.06.1-ce-standard
MAINTAINER EricoGR <ericogr@gmail.com>
LABEL Description="Microsoft Devops agent with ansible"

RUN apt update
RUN apt install software-properties-common
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt install ansible
