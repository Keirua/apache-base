FROM ubuntu:12.04

MAINTAINER clement@keiruaprod.fr

# Install the relevant packages
RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install openssh-server supervisor apache2 libapache2-mod-php5 -y


RUN mkdir -p /var/run/sshd && chmod 755 /var/run/sshd
RUN echo 'root:sshpwd' |chpasswd
RUN mkdir -p /var/log/supervisor

ADD ./conf/supervisord-config.conf /etc/supervisor/conf.d/supervisord.conf

# Enable the php mod we just installed
RUN a2enmod php5

# Update our apache sites available with the config we created
ADD ./conf/apache-config.conf /etc/apache2/sites-available/apache-config
RUN rm /etc/apache2/sites-enabled/*
RUN ln -s /etc/apache2/sites-available/apache-config /etc/apache2/sites-enabled/default

# expose port 8080 so that our webserver can respond to requests.
# we want to expose the port 22 as well so that people can connect using ssh
EXPOSE 8080

# Manually set the apache environment variables in order to get apache to work immediately.
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

# Execute the apache daemon in the foreground so we can treat the container as an 
# executeable and it wont immediately return.
CMD ["/usr/sbin/apache2", "-D", "FOREGROUND"]