#在给定目录创建dockerfile文件
if [ -d "$PWD/$1" ]; then  
docker rm -f shenshuangxi$1
docker rmi shenshuangxi/$1
rm -drf $PWD/$1
fi  
#docker rm -f shenshuangxi$1
#docker rmi shenshuangxi/$1　
#rm -drf $PWD/$1  
mkdir $1
touch $1/Dockerfile
cp $1.war $1/
cd $1

echo $PWD

echo "FROM shenshuangxi/ubuntu-xenial-tomcat8" >> Dockerfile
echo "MAINTAINER shenshuangxi <1695904589@qq.com>" >> Dockerfile
echo "ENV REFRESHED_AT 2017-12-22" >> Dockerfile

echo "RUN rm -f -d -r /home/apache-tomcat-8.0.48/webapps/*" >> Dockerfile
echo "COPY $1.war /home/apache-tomcat-8.0.48/webapps/" >> Dockerfile 
echo "RUN mv /home/apache-tomcat-8.0.48/webapps/$1.war /home/apache-tomcat-8.0.48/webapps/ROOT.war" >> Dockerfile

docker build -t shenshuangxi/$1 .
docker run -d -p $2:8080 --name shenshuangxi$1  shenshuangxi/$1
