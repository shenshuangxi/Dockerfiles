FROM shenshuangxi/bionic:latest
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2019-04-30

RUN apt-get -y update && apt-get install -y curl

RUN apt-get -y update 

WORKDIR /home

COPY jdk-8u151-linux-x64.tar.gz   /home/
COPY elasticsearch-7.0.0-linux-x86_64.tar.gz /home/

RUN tar -xvf jdk-8u151-linux-x64.tar.gz
RUN rm -f jdk-8u151-linux-x64.tar.gz

ENV JAVA_HOME /home/jdk1.8.0_151
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin


RUN tar -xvf elasticsearch-7.0.0-linux-x86_64.tar.gz
RUN rm -f elasticsearch-7.0.0-linux-x86_64.tar.gz



EXPOSE 9200
EXPOSE 9300

#RUN echo "vm.max_map_count=655360" >> /etc/sysctl.conf 
#RUN /sbin/sysctl -p

#RUN echo "cluster.initial_master_nodes: ["node-1"]" >> /home/elasticsearch-7.0.0/config/elasticsearch.yml
#RUN echo "network.host: 0.0.0.0" >> /home/elasticsearch-7.0.0/config/elasticsearch.yml
#RUN echo "http.port: 9200" >> /home/elasticsearch-7.0.0/config/elasticsearch.yml
RUN mkdir /var/elasticsearch && mkdir /var/elasticsearch/log && mkdir /var/elasticsearch/data 


COPY elasticsearch.yml /home/elasticsearch-7.0.0/config/

RUN groupadd elsearch
RUN useradd elsearch -g elsearch -p elasticsearch
RUN chown -R elsearch:elsearch  /home/elasticsearch-7.0.0

#RUN su elsearch

USER elsearch


#VOLUME [ "/home/elasticsearch-6.1.1/config", "/var/log/elasticsearch", "/var/lib/elasticsearch" ]

ENTRYPOINT [ "/home/elasticsearch-7.0.0/bin/elasticsearch" ]


