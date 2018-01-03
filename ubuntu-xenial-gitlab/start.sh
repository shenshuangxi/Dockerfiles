docker run -d \
    --hostname 192.168.137.4 \
    --publish 10443:443 --publish 10080:80 --publish 10022:22 \
    --name gitlab \
    --restart always \
    --volume /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/config:/etc/gitlab \
    --volume /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/logs:/var/log/gitlab \
    --volume /home/shenshuangxi/share/git/ubuntu-xenial-gitlab/data:/var/opt/gitlab \
    gitlab/gitlab-ce
