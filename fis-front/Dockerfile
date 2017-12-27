FROM shenshuangxi/ubuntu-xenial-node
MAINTAINER shenshuangxi <1695904589@qq.com>
ENV REFRESHED_AT 2017-12-21

WORKDIR /home

COPY fis-front /home/

WORKDIR /home/fis-front

RUN yarn install

EXPOSE 8080

CMD [ "yarn", "start" ]


