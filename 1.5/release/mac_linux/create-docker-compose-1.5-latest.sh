#!/bin/bash
# path = " ./create-docker-compose.sh"
cd ~/desktop
mkdir causeway
cd causeway
mkdir volumes
cd volumes
mkdir  frontend
mkdir  backend
mkdir  typedb
cd ..
rm docker-compose.yml
echo services:>>docker-compose.yml
echo -e ' ' typedb:>>docker-compose.yml
echo -e '  ' image: public.ecr.aws/r5d0x2q7/typedb:latest>>docker-compose.yml
echo -e '  ' container_name: typedb>>docker-compose.yml
echo -e '  ' volumes:>>docker-compose.yml
echo -e '   ' - geminos:/data/typedb:rw>>docker-compose.yml
echo -e '   ' - ~/dektop/causeway/volumes/typedb:/typedb:rw>>docker-compose.yml
echo -e '  ' ports:>>docker-compose.yml
echo -e '   ' - "1729:1729">>docker-compose.yml
echo -e '  ' restart: always>>docker-compose.yml
echo -e '  ' extra_hosts:>>docker-compose.yml
echo -e '   ' - "host.docker.internal:host-gateway">>docker-compose.yml
echo -e ' ' gui:>>docker-compose.yml
echo -e '  ' image: public.ecr.aws/r5d0x2q7/causewaygui:latest>>docker-compose.yml
echo -e '  ' container_name: causewaygui>>docker-compose.yml
echo -e '  ' volumes:>>docker-compose.yml
echo -e '   ' - geminos:/data:rw>>docker-compose.yml
echo -e '   ' - geminos:/root:rw>>docker-compose.yml
echo -e '   ' - ~/desktop/causeway/volumes/frontend:/frontend:rw>>docker-compose.yml
echo -e '  ' ports:>>docker-compose.yml
echo -e '   ' - "1880:1880">>docker-compose.yml
echo -e '  ' depends_on:>>docker-compose.yml
echo -e '   ' - "typedb">>docker-compose.yml
echo -e '  ' restart: always>>docker-compose.yml
echo -e '  ' extra_hosts:>>docker-compose.yml
echo -e '   ' - "host.docker.internal:host-gateway">>docker-compose.yml
echo -e ' '  api:>>docker-compose.yml
echo -e '  ' image: public.ecr.aws/r5d0x2q7/causewayapi:latest>>docker-compose.yml
echo -e '  ' container_name: causewayapi>>docker-compose.yml
echo -e '  ' volumes:>>docker-compose.yml
# echo -e '   ' - geminos:/data/causal-api-server/geminosnb:rw>>docker-compose.yml
echo -e '   ' - geminos:/data:rw>>docker-compose.yml
echo -e '   ' - geminos:/root:rw>>docker-compose.yml
echo -e '   ' - ~/desktop/causeway/volumes/backend:/backend:rw>>docker-compose.yml
echo -e '   ' - ~/desktop/causeway/volumes/backend:/data:rw>>docker-compose.yml
echo -e '  ' restart: "always">>docker-compose.yml
echo -e '  ' ports:>>docker-compose.yml
echo -e '   ' - "5001:5001">>docker-compose.yml
echo -e '  ' depends_on:>>docker-compose.yml
echo -e '   ' - typedb>>docker-compose.yml
echo -e '   ' - gui>>docker-compose.yml
echo -e '  ' extra_hosts:>>docker-compose.yml
echo -e '   ' - "host.docker.internal:host-gateway">>docker-compose.yml
echo volumes:>>docker-compose.yml
echo -e '  ' geminos:>>docker-compose.yml
echo -e '   ' driver: local>>docker-compose.yml
exec docker compose up -d --pull always