#!/bin/sh
docker run -v `pwd`/src/:/var/www/my_app -p 81:80 -t keirua/apache-base