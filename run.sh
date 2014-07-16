#!/bin/sh
docker run -v `pwd`/docker/apache-base/src/:/var/www/my_app -p 80:80 -t keirua/apache-base