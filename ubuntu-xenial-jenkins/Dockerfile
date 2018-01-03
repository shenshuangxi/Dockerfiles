FROM shenshuangxi/ubuntu-xenial-base
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-21

WORKDIR /home

COPY jdk-8u151-linux-x64.tar.gz   /home/
COPY apache-tomcat-8.0.48.tar.gz /home/


RUN apt-get -y update

RUN tar -zxvf jdk-8u151-linux-x64.tar.gz
RUN rm -f jdk-8u151-linux-x64.tar.gz

ENV JAVA_HOME /home/jdk1.8.0_151
ENV JRE_HOME $JAVA_HOME/jre
ENV CLASSPATH .:$JAVA_HOME/lib:$JRE_HOME/lib
ENV PATH $PATH:$JAVA_HOME/bin


RUN tar -zxvf apache-tomcat-8.0.48.tar.gz
RUN rm -f apache-tomcat-8.0.48.tar.gz

ENV CATALINA_HOME /home/apache-tomcat-8.0.48


RUN rm -f -d -r /home/apache-tomcat-8.0.48/webapps/ROOT


COPY jenkins.war /home/apache-tomcat-8.0.48/webapps/

RUN mv /home/apache-tomcat-8.0.48/webapps/jenkins.war /home/apache-tomcat-8.0.48/webapps/ROOT.war

COPY apache-maven-3.5.2-bin.tar.gz /home/

RUN tar -zxvf apache-maven-3.5.2-bin.tar.gz 

RUN rm -f apache-maven-3.5.2-bin.tar.gz

COPY  settings.xml  /home/apache-maven-3.5.2/conf/

ENV M2_HOME /home/apache-maven-3.5.2

ENV PATH $PATH:$M2_HOME/bin

RUN apt-get install -y git

EXPOSE 8080

ENTRYPOINT [ "/home/apache-tomcat-8.0.48/bin/catalina.sh", "run" ]


