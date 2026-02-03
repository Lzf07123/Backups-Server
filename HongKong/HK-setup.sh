#!/bin/bash
#file
NGINX_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/nginx-proxy-manager.tar?sign=zObDB2I-Nd2TOjcteNqsGszxcQ2pmiykByXrMrBY3cI=:0
ALIST_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/alist_2.tar?sign=eCDhBfo33oTMIObvRirvlz1aH19wehTCCrt_a_KfPA8=:0
MOMENTS_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/moments.tar?sign=MNEn3ZiZq7P9SBukUkc4IbUI96xrRxZkrqADoi2awi0=:0
XPANEL_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/xui.tar?sign=XHSa1v6jrFKAuLFIAzdMtMTcpZsuH_QIEeAOxFG4cl0=:0
FRP_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/frp-panel.tar?sign=tsIwCXq4Eu006E8o9O4JXeY3j4dZeIvnEGh9qrTkqHY=:0
RUN_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/HongKong/docker/compose.yml?sign=7ks73mYH_-sm-fuGlCJj86_okaJqd6iUof2TF3mv56Y=:0
ENV_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/HongKong/docker/.env?sign=uFTQyOyatFr19w7RMKjdcupOe7pxb8Bw-PqIagM5iiA=:0
#HK-setup
apt-get update
apt-get upgrade -y
apt-get install unzip docker.io docker-compose docker-compose-v2 -y
cd /mnt
mkdir image && mkdir data
cd image
wget -L -O nginx.tar ${NGINX_IMAGE}
wget -L -O alist.tar ${ALIST_IMAGE}
wget -L -O moments.tar ${MOMENTS_IMAGE}
wget -L -O xpanel.tar ${XPANEL_IMAGE}
wget -L -O frp.tar ${FRP_IMAGE}
docker load -i nginx.tar
docker load -i alist.tar
docker load -i moments.tar
docker load -i xpanel.tar
docker load -i frp.tar
cd ../data
wget -L -O compose.yml ${RUN_FILE}
wget -L -O .env ${ENV_FILE}
docker compose up -d
rm -r /mnt/image
docker ps
echo '部署完成'