FROM shenshuangxi/bionic:latest
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2019-04-30

RUN apt-get -y update && apt-get install -y curl

RUN apt-get -y update 

WORKDIR /home

COPY jdk-8u151-linux-x64.tar.gz   /home/
COPY filebeat-7.0.0-linux-x86_64.tar.gz   /home/
COPY logstash-tutorial.log.gz   /home

RUN tar -xvf jdk-8u151-linux-x64.tar.gz
RUN rm -f jdk-8u151-linux-x64.tar.gz

ENV JAVA_HOME /home/jdk1.8.0_151
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

RUN tar -xvf filebeat-7.0.0-linux-x86_64.tar.gz
RUN rm -f filebeat-7.0.0-linux-x86_64.tar.gz

RUN gunzip logstash-tutorial.log.gz -d /var/log/
RUN rm -f logstash-tutorial.log.gz

COPY filebeat.yml   /home/filebeat-7.0.0-linux-x86_64

ENTRYPOINT ["sh", "-c", "/home/filebeat-7.0.0-linux-x86_64/filebeat -e -c filebeat.yml -d "publish"" ]


