#!/bin/sh
docker run -p 80:80 -v docker/apache-base/src/:/var/www/my_website -t keirua/apache-base
