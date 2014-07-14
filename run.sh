#!/bin/sh
docker run -v /home/clem/dev/docker-apache/docker/apache-base/src/:/var/www/my_website -p 80:80 -t keirua/apache-base
