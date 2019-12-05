FROM ubuntu:18.04
MAINTAINER EricoGR <ericogr@gmail.com>
LABEL Description="Microsoft Devops agent with ansible"

# To make it easier for build and release pipelines to run apt-get,
# configure apt to not require confirmation (assume the -y argument by default)
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes

RUN apt update
RUN apt install software-properties-common

RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN add-apt-repository "deb http://security.ubuntu.com/ubuntu xenial-security main"

RUN apt-get update \
&& apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        iputils-ping \
        libcurl4 \
        libicu55 \
        libunwind8 \
        netcat \
        ansible

WORKDIR /azp

COPY ./start.sh .
RUN chmod +x start.sh

CMD ["./start.sh"]
