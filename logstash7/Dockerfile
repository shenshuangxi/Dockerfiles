FROM shenshuangxi/bionic:latest
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2019-04-30

RUN apt-get -y update && apt-get install -y curl

RUN apt-get -y update 

WORKDIR /home

COPY jdk-8u151-linux-x64.tar.gz   /home/
COPY logstash-7.0.0.tar.gz   /home/

RUN tar -xvf jdk-8u151-linux-x64.tar.gz
RUN rm -f jdk-8u151-linux-x64.tar.gz

ENV JAVA_HOME /home/jdk1.8.0_151
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin

RUN tar -xvf logstash-7.0.0.tar.gz
RUN rm -f logstash-7.0.0.tar.gz

COPY logstash.yml /home/logstash-7.0.0/config/
#COPY first-pipeline.conf /home/logstash-7.0.0/first-pipeline.conf

EXPOSE 9600
EXPOSE 5044

ENTRYPOINT ["sh", "-c", "/home/logstash-7.0.0/bin/logstash" ]


