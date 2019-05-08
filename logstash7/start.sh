### Esc进入命令行运行模式
### : set ff=unix
docker run --name kibana7 -d  \
	-p 10102:5601   \
	-v /home/shenshuangxi/share/docker-volume/kibana7/logs:/var/log/kibana  \
	-v /home/shenshuangxi/share/docker-volume/kibana7/data:/var/lib/kibana  \
	kibana7
	
		