FROM shenshuangxi/ubuntu-xenial-base
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-21

WORKDIR /home

COPY node-v8.9.3-linux-x64.tar  /home
#COPY Python-3.6.4.tgz /home


RUN apt-get -y update

RUN apt-get install -y g++ gcc make python zlib*

RUN apt-get -y update


#RUN tar xfz Python-3.6.4.tgz
#WORKDIR /home/Python-3.6.4
#RUN ./configure
#RUN make
#RUN make test
#RUN make install 
#RUN rm Python-3.6.4.tgz
#RUN ln -s /home/Python-3.6.4/bin/python3.6 /usr/bin/python


#WORKDIR /home
RUN tar -xvf node-v8.9.3-linux-x64.tar
RUN rm -f node-v8.9.3-linux-x64.tar

RUN ln -s /home/node-v8.9.3-linux-x64/bin/node /usr/local/bin/node
RUN ln -s /home/node-v8.9.3-linux-x64/bin/npm /usr/local/bin/npm
RUN ln -s /home/node-v8.9.3-linux-x64/bin/npx /usr/local/bin/npx

RUN  npm install --global yarn
RUN ln -s /home/node-v8.9.3-linux-x64/bin/yarn /usr/local/bin/yarn  
RUN ln -s /home/node-v8.9.3-linux-x64/bin/yarnpkg /usr/local/bin/yarnpkg
