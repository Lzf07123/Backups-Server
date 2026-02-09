#!/bin/bash
#file
NGINX_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/nginx-proxy-manager.tar?sign=zObDB2I-Nd2TOjcteNqsGszxcQ2pmiykByXrMrBY3cI=:0
ALIST_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/alist_2.tar?sign=eCDhBfo33oTMIObvRirvlz1aH19wehTCCrt_a_KfPA8=:0
MOMENTS_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/moments.tar?sign=MNEn3ZiZq7P9SBukUkc4IbUI96xrRxZkrqADoi2awi0=:0
XPANEL_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/xui.tar?sign=XHSa1v6jrFKAuLFIAzdMtMTcpZsuH_QIEeAOxFG4cl0=:0
AGENT_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/agent.tar?sign=s1J8OGbvazjlYw6bOtpipq6ckV3654V1IyuI5JeeMxs=:0
FRP_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/frps.tar?sign=Gbdsc6xHtdaA2IQQ5rsUX1sAsIF-VX3dy7UvfWZ3-9M=:0
RUN_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/HongKong/docker/compose.yml?sign=7ks73mYH_-sm-fuGlCJj86_okaJqd6iUof2TF3mv56Y=:0
ENV_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/HongKong/docker/.env?sign=uFTQyOyatFr19w7RMKjdcupOe7pxb8Bw-PqIagM5iiA=:0
#HK-setup
apt-get update
apt-get upgrade -y
apt-get install wget unzip docker.io docker-compose-v2 -y
cd /mnt
mkdir image && mkdir docker
echo -e "\e[32m============开始拉取镜像============"
cd image
wget -L -O nginx.tar ${NGINX_IMAGE}
wget -L -O alist.tar ${ALIST_IMAGE}
wget -L -O moments.tar ${MOMENTS_IMAGE}
wget -L -O xpanel.tar ${XPANEL_IMAGE}
wget -L -O frp.tar ${FRP_IMAGE}
wget -L -O agent.tar ${AGENT_IMAGE}
docker load -i nginx.tar
docker load -i alist.tar
docker load -i moments.tar
docker load -i xpanel.tar
docker load -i frp.tar
docker load -i agent.tar
echo -e "============镜像拉取完成============\e[0m"
cd ../docker
echo -e "\e[32m============启动容器============\e[0m"
wget -L -O compose.yml ${RUN_FILE}
wget -L -O .env ${ENV_FILE}
docker compose up -d
rm -r /mnt/image
docker ps
read -p "$(echo -e '\e[32m============部署完成============\e[0m')"