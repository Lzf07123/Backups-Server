#!/bin/bash
#file
NGINX_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/nginx-proxy-manager.tar?sign=zObDB2I-Nd2TOjcteNqsGszxcQ2pmiykByXrMrBY3cI=:0
HALO_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/halo_2_22.tar?sign=egCqi8_k9EAidBt1uVFPs_9b8xX73evlHEusUzlX9ng=:0
HALODB_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/postgres.tar?sign=VXsSA1hTIrYoGGN1dt0eW-Nj1PIL1PvGgkCmIRuxrkw=:0
FRPS_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/frps.tar?sign=Gbdsc6xHtdaA2IQQ5rsUX1sAsIF-VX3dy7UvfWZ3-9M=:0
DOCGUI_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/portainer-ce.tar?sign=LRAOy6xZV8PaMZ3zMWT2jBfjSNevx2wz4yCPfo7nvtc=:0
MEILI_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/meili.tar?sign=ba3EdEbppaQGTu5n-QG2vyLbdiCpS3rFK3FKBZDUYFE=:0
RUN_ALL_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/all-compose.yml?sign=rcts4TmseGmgX2y_RFyeEGyI_L1xyLsUzd0iz1rDiTA=:0
RUN_HALO_2_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/halo-2-compose.yml?sign=Q9dhA6qx41YVa50YlzPo-vvN1Uwd_oUlIt_t5M_kMxg=:0
RUN_DOCGUI_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/docgui-compose.yml?sign=lkcVTk_v9cgjzGX3vddFKz45C3Ytq29yUDrt69RuvUw=:0
#GZ-setup
apt-get update
apt-get upgrade -y
apt-get install wget docker.io docker-compose-v2 -y
cd /mnt
mkdir image && mkdir docker
cd image
echo -e "\e[32m============开始拉取镜像============\e[0m"
wget -c -L --progress=bar --show-progress -O nginx.tar ${NGINX_IMAGE} 1>/dev/null
wget -c -L --progress=bar --show-progress -O halo.tar ${HALO_IMAGE} 1>/dev/null
wget -c -L --progress=bar --show-progress -O halodb.tar ${HALODB_IMAGE} 1>/dev/null
wget -c -L --progress=bar --show-progress -O frps.tar ${FRPS_IMAGE} 1>/dev/null
wget -c -L --progress=bar --show-progress -O meili.tar ${MEILI_IMAGE} 1>/dev/null
wget -c -L --progress=bar --show-progress -O docgui.tar ${DOCGUI_IMAGE} 1>/dev/null
docker load -i nginx.tar
docker load -i halo.tar
docker load -i halodb.tar
docker load -i frps.tar
docker load -i meili.tar
docker load -i docgui.tar
echo -e "\e[32m============镜像拉取完成============\e[0m"
cd ../docker
mkdir halo_2 && mkdir dockergui && mkdir all
cd all
echo -e "\e[32m============启动容器============\e[0m"
wget -c -L --progress=bar --show-progress -O compose.yml ${RUN_ALL_FILE} 1>/dev/null
docker compose up -d
cd ../halo_2
wget -c -L --progress=bar --show-progress -O compose.yml ${RUN_HALO_2_FILE} 1>/dev/null
docker compose up -d
cd ../dockergui
wget -c -L --progress=bar --show-progress -O compose.yml ${RUN_DOCGUI_FILE} 1>/dev/null
docker compose up -d
rm -r /mnt/image
docker ps
read -p "$(echo -e '\e[32m============部署完成============\e[0m')"