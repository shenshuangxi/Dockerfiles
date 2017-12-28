FROM shenshuangxi/ubuntu-xenial-base
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-21

WORKDIR /home

COPY pcre-8.41.tar.gz  /home
COPY zlib-1.2.11.tar.gz  /home
COPY nginx-1.12.2.tar.gz  /home
COPY openssl-1.0.2n.tar.gz  /home



RUN apt-get -y update

RUN apt-get install -y g++ gcc make 

RUN apt-get -y update

RUN tar -zxvf pcre-8.41.tar.gz
WORKDIR /home/pcre-8.41
RUN ./configure 
RUN make && make install

WORKDIR /home
RUN rm pcre-8.41.tar.gz


RUN tar -zxvf zlib-1.2.11.tar.gz
WORKDIR /home/zlib-1.2.11
RUN ./configure 
RUN make && make install

RUN apt-get update && apt-get install -y openssl
RUN apt-get update && apt-get install -y libssl-dev

WORKDIR /home
RUN rm zlib-1.2.11.tar.gz

RUN tar -zxvf nginx-1.12.2.tar.gz
WORKDIR /home/nginx-1.12.2
RUN ./configure \
--with-http_ssl_module \
--with-pcre=/home/pcre-8.41 \
--with-zlib=/home/zlib-1.2.11 
RUN make && make install


WORKDIR /home
RUN rm nginx-1.12.2.tar.gz

ENV NGINX_HOME /usr/local/nginx
ENV PATH $PATH:$NGINX_HOME/sbin

RUN sh /etc/profile

RUN echo "\ndaemon off;" >> /usr/local/nginx/conf/nginx.conf

EXPOSE 80

CMD [ "nginx" ]

