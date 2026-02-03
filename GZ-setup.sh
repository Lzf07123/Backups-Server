#!/bin/bash
#file
NGINX_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/nginx-proxy-manager.tar?sign=zObDB2I-Nd2TOjcteNqsGszxcQ2pmiykByXrMrBY3cI=:0
HALO_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/halo_2_22.tar?sign=egCqi8_k9EAidBt1uVFPs_9b8xX73evlHEusUzlX9ng=:0
HALODB_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/postgres.tar?sign=VXsSA1hTIrYoGGN1dt0eW-Nj1PIL1PvGgkCmIRuxrkw=:0
FRP_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/frp-panel.tar?sign=tsIwCXq4Eu006E8o9O4JXeY3j4dZeIvnEGh9qrTkqHY=:0
MEILI_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/meili.tar?sign=ba3EdEbppaQGTu5n-QG2vyLbdiCpS3rFK3FKBZDUYFE=:0
KANBOARD_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/kanboard.tar?sign=tPJPKxsuA1i0AGw3m63cX_tjoALhBebYa-cSYMRXs7U=:0
RUN_ALL_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/all/all-compose.yml?sign=_kstMc2W91XCqY1jTG9TNQjFFaeLwee1Dynn2ZCMxrw=:0
RUN_HALO_2_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/halo-2/halo-2-compose.yml?sign=VV0gYgTPKxAuI6DEmk35xgT8k5y4SLjteFy1MsvIG8c=:0
RUN_KANBOARD_FILE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/GuangZhou/docker/kanboard/kanboard-compose.yml?sign=BxDwcZU2ZACo0sLsMx_g_J1yUxVVAoKzQKiH-9cnueY=:0
#HK-setup
apt-get update
apt-get upgrade -y
apt-get install unzip docker.io docker-compose docker-compose-v2 -y
cd /mnt
mkdir image && mkdir data
cd image
wget -L -O nginx.tar ${NGINX_IMAGE}
wget -L -O halo.tar ${HALO_IMAGE}
wget -L -O halodb.tar ${HALODB_IMAGE}
wget -L -O frp.tar ${FRP_IMAGE}
wget -L -O meili.tar ${MEILI_IMAGE}
wget -L -O kanboard.tar ${KANBOARD_IMAGE}
docker load -i nginx.tar
docker load -i halo.tar
docker load -i halodb.tar
docker load -i frp.tar
docker load -i meili.tar
docker load -i kanboard.tar
cd ../data
mkdir halo_2 && mkdir kanboard
wget -L -O compose.yml ${RUN_ALL_FILE}
docker compose up -d
cd halo_2
wget -L -O compose.yml ${RUN_HALO_2_FILE}
docker compose up -d
cd ../kanboard
wget -L -O compose.yml ${RUN_KANBOARD_FILE}
docker compose up -d
rm -r /mnt/image
docker ps
echo '部署完成'