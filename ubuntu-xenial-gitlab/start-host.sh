docker run --name='gitlab'  -d \
  -h '192.168.137.4' \
  -p 10022:10022 -p 10080:80 -p 10443:443 \
  -v /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/config:/etc/gitlab \
  -v /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/logs:/var/log/gitlab \
  -v /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/data:/var/opt/gitlab \
  gitlab/gitlab-ce
