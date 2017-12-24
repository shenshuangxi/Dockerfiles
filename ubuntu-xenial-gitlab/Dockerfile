FROM shenshuangxi/ubuntu-xenial-base
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-24

WORKDIR /home

COPY gitlab-ce_10.3.0-ce.0_amd64.deb /home/

RUN apt-get -y update && apt-get install -y curl openssh-server ca-certificates postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-Ce/script.deb.sh | bash

RUN EXTERNAL_URL="http://localhost:8080"
RUN external_url="http://localhost:8080"

RUN dpkg -i gitlab-ce_10.3.0-ce.0_amd64.deb 

RUN EXTERNAL_URL="http://localhost:8080"
RUN external_url="http://localhost:8080"

RUN gitlab-ctl reconfigure


