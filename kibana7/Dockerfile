FROM shenshuangxi/bionic:latest
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2019-04-30

RUN apt-get -y update && apt-get install -y curl

RUN apt-get -y update 

WORKDIR /home

COPY kibana-7.0.0-linux-x86_64.tar.gz   /home/

RUN tar -xvf kibana-7.0.0-linux-x86_64.tar.gz
RUN rm -f kibana-7.0.0-linux-x86_64.tar.gz

EXPOSE 5601

RUN echo "server.port: 5601" >> /home/kibana-7.0.0-linux-x86_64/config/kibana.yml
RUN echo "server.host: \"0.0.0.0\"" >> /home/kibana-7.0.0-linux-x86_64/config/kibana.yml
RUN echo "elasticsearch.hosts: [\"http://192.168.0.104:10100\"]" >> /home/kibana-7.0.0-linux-x86_64/config/kibana.yml
RUN echo "elasticsearch.preserveHost: false" >> /home/kibana-7.0.0-linux-x86_64/config/kibana.yml

ENTRYPOINT [ "/home/kibana-7.0.0-linux-x86_64/bin/kibana" ]


