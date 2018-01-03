docker run --name shenshuangxielasticsearch -d  \
	-p 10100:9200 -p 10101:9300   \
	-v /home/shenshuangxi/share/git/ubuntu-xenial-elasticsearch/logs:/var/log/elasticsearch  \
	-v /home/shenshuangxi/share/git/ubuntu-xenial-elasticsearch/data:/var/lib/elasticsearch  \
	shenshuangxi/ubuntu-xenial-elasticsearch
	
		-v /home/shenshuangxi/share/git/ubuntu-xenial-elasticsearch/config:/home/elasticsearch-6.1.1/config  \