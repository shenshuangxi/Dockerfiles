docker run --name elasticsearch7 -d -p 10100:9200 -p 10101:9300   \
	-v /home/shenshuangxi/share/docker-volume/elasticsearch7/logs:/home/elasticsearch-7.0.0/logs/log  \
	-v /home/shenshuangxi/share/docker-volume/elasticsearch7/data:/home/elasticsearch-7.0.0/logs/data  elasticsearch7
	
		
