FROM ubuntu:12.04

MAINTAINER clement@keiruaprod.fr

# Install the relevant packages
RUN apt-get update && apt-get install apache2 libapache2-mod-php5 -y

# Enable the php mod we just installed
RUN a2enmod php5

# Update our apache sites available with the config we created
ADD ./conf/apache-config.conf /etc/apache2/sites-available/apache-config
RUN rm /etc/apache2/sites-enabled/*
RUN ln -s /etc/apache2/sites-available/apache-config /etc/apache2/sites-enabled/default

#Could work but requires to rebuild the image after every modification
#RUN mkdir -p /var/www/my_app
#ADD src/index.php /var/www/my_app/index.php

# expose port 8080 so that our webserver can respond to requests.
EXPOSE 8080

# Manually set the apache environment variables in order to get apache to work immediately.
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Execute the apache daemon in the foreground so we can treat the container as an 
# executeable and it wont immediately return.
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]