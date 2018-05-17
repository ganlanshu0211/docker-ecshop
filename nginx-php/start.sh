#!/bin/bash
docker build -t ecshop .
docker run --name ecshop -p 80:80 -v /data/tool/:/var/www/html --link mysql:mysql -d ecshop
