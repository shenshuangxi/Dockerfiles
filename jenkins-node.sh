#在给定目录创建dockerfile文件

if [ -d "$PWD/$1" ]; then
        if [ -d "$PWD/$1/docker" ]; then
                docker rm -f shenshuangxi$1
                docker rmi shenshuangxi/$1
                rm -drf $PWD/$1/docker
        fi

        cd $1
        mkdir docker
        touch docker/Dockerfile

        cp $1.tar.gz docker/
        mv $1.tar.gz  $1-`date +%Y%m%d%H%M%S`.tar.gz
        cd docker

        echo $PWD

        echo "FROM shenshuangxi/ubuntu-xenial-nginx" >> Dockerfile
        echo "MAINTAINER shenshuangxi <1695904589@qq.com>" >> Dockerfile
        echo "ENV REFRESHED_AT 2017-12-22" >> Dockerfile
		echo "" >> Dockerfile
        echo "WORKDIR /home" >> Dockerfile
        echo "COPY $1.tar.gz /usr/local/nginx/" >> Dockerfile
		echo "WORKDIR /usr/local/nginx/" >> Dockerfile
		echo "RUN tar -zxvf $1.tar.gz" >> Dockerfile
		echo "RUN rm $1.tar.gz" >> Dockerfile
		echo "" >> Dockerfile
		echo "WORKDIR /usr/local/nginx/conf" >> Dockerfile
		echo "RUN echo \"worker_processes  1;\" > nginx.conf " >> Dockerfile
		echo "RUN echo \"events { worker_connections  1024; }\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"http {\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\tinclude       mime.types;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\tdefault_type  application/octet-stream;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\tsendfile        on;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\tunderscores_in_headers on;#自定义 Head 必须定义 \" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\tserver {\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\tlisten       80;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\tserver_name  localhost;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\tlocation / { root   $1; index  index.html index.htm; }\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\terror_page   500 502 503 504  /index.html;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\tlocation = /index.html { root   $1; }\" >> nginx.conf " >> Dockerfile
		
		echo "RUN echo \"\t\tlocation /api/{\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t\tproxy_pass http://192.168.137.4:10097;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t\tproxy_set_header HOST \\\$host;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t\tproxy_set_header X-Forwarded-For \\\$proxy_add_x_forwarded_for;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t\tproxy_set_header X-Real-IP \\\$remote_addr;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t\tproxy_set_header Request-Url \\\$request_uri;\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"\t\t}\" >> nginx.conf " >> Dockerfile
		
		echo "RUN echo \"\t}\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"}\" >> nginx.conf " >> Dockerfile
		echo "RUN echo \"daemon off;\" >> nginx.conf " >> Dockerfile
		echo "WORKDIR /home" >> Dockerfile

        docker build -t shenshuangxi/$1 .
        docker run -d -p $2:80 --name shenshuangxi$1  shenshuangxi/$1
fi
