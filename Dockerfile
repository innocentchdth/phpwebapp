FROM ubuntu:16.04

LABEL maintainer = "innocentchdth"

#Preparing installations
RUN apt-get update -y

#Installing Apache
RUN apt-get install -y apache2

#Installing PHP
RUN apt-get install -y php7.0 libapache2-mod-php7.0 php7.0-cli php7.0-common php7.0-mbstring php7.0-gd php7.0-intl php7.0-xml php7.0-mysql php7.0-mcrypt php7.0-zip

#Placing project files
RUN rm -rf /var/www/html/*
ADD phpinfopage /var/www/html

#Configure Apache
RUN chown -R www-data:www-data /var/www
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2

#Open port 80
EXPOSE 80

#Start Apache service
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
