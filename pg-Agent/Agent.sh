#!/bin/bash
# shellcheck disable=SC2125
AGENT_IMAGE=https://alist.hk.lizf.cn/d/Mobile%20Cloud/backups/Backups_Server/docker_images/agent.tar?sign=s1J8OGbvazjlYw6bOtpipq6ckV3654V1IyuI5JeeMxs=:0
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install sudo wget -y
sudo apt-get install docker.io -y
sudo apt-get install docker-compose-v2 -y
cd /mnt || exit
sudo mkdir Agent
cd Agent || exit
wget -L -O agent.tar "${AGENT_IMAGE}"
docker load -i agent.tar
cat > "compose.yml" << EOF
services:
  agent:
    container_name: portainer-agent
    image: portainer/agent:2.33.6
    restart: always
    volumes:
      - /var/run/docker.sock:/var/run/docker.sock
      - /mnt/agent/volumes:/var/lib/docker/volumes
    network_mode: host
EOF
docker compose up -d
rm agent.tar
docker ps
# shellcheck disable=SC2162
echo -e "\e[32m连接地址=IP/域名:9001\e[0m"
read -p "$(echo -e '\e[32m==========Agent安裝完成==========\e[0m')"