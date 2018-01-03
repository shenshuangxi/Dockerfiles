FROM shenshuangxi/ubuntu-xenial-base
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-24

WORKDIR /home

COPY gitlab-ce_10.3.0-ce.0_amd64.deb /home/

RUN apt-get -y update && apt-get install -y curl openssh-server ca-certificates postfix

RUN curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-Ce/script.deb.sh | bash

RUN EXTERNAL_URL="http://localhost:8080"

RUN dpkg -i gitlab-ce_10.3.0-ce.0_amd64.deb 

RUN echo "## GitLab configuration settings" > /etc/gitlab/gitlab.rb 
RUN echo "##! This file is generated during initial installation and **is not** modified" >> /etc/gitlab/gitlab.rb
RUN echo "##! during upgrades." >> /etc/gitlab/gitlab.rb
RUN echo "##! Check out the latest version of this file to know about the different" >> /etc/gitlab/gitlab.rb
RUN echo "##! settings that can be configured by this file, which may be found at:" >> /etc/gitlab/gitlab.rb
RUN echo "##! https://gitlab.com/gitlab-org/omnibus-gitlab/raw/master/files/gitlab-config-template/gitlab.rb.template" >> /etc/gitlab/gitlab.rb
RUN echo "" >> /etc/gitlab/gitlab.rb
RUN echo "" >> /etc/gitlab/gitlab.rb
RUN echo "## GitLab URL" >> /etc/gitlab/gitlab.rb
RUN echo "##! URL on which GitLab will be reachable." >> /etc/gitlab/gitlab.rb
RUN echo "##! For more details on configuring external_url see:" >> /etc/gitlab/gitlab.rb
RUN echo "##! https://docs.gitlab.com/omnibus/settings/configuration.html#configuring-the-external-url-for-gitlab" >> /etc/gitlab/gitlab.rb
RUN echo "external_url 'http://localhost:8080'" >> /etc/gitlab/gitlab.rb


RUN gitlab-ctl reconfigure


