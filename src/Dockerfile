FROM php:8.1-apache

## PHP-Apache-PDO modules
RUN docker-php-ext-install pdo sockets pdo_mysql

## Enable URL Rewriting
RUN a2enmod rewrite

## Load PHP extension
RUN php -d extension=curl.so

## Update and Install usefull package
RUN apt-get update && \
    apt-get install zip curl -y && \
    apt clean -y

## Set ServerName Directive
RUN echo "ServerName MyWebserver" >> /etc/apache2/apache2.conf

## Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/local/bin/composer

## Set permission for packet managers installation directories
RUN mkdir -p /var/www/.cache && chown 33:33 /var/www/.cache/ && \
    mkdir -p /var/www/.local && chown 33:33 /var/www/.local

RUN echo '' > /etc/apache2/ports.conf

## COPY service config file
COPY ./apache/conf/000-default.conf /etc/apache2/sites-available/000-default.conf

## Run Apache/PHP Server
CMD apachectl -D FOREGROUND