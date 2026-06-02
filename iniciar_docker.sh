#!/bin/bash
docker-compose up -d
read -r id resto <<< $(docker ps | grep "linux-test")
docker exec -it $id bash
