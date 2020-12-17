# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sabra <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/17 17:25:03 by sabra             #+#    #+#              #
#    Updated: 2020/12/17 18:54:44 by sabra            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# Установка необходимых пакетов в образе

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx default-mysql-server php7.3-fpm \
php7.3-mysql php-mbstring openssl vim

# Скачивание и установка дополнительных пакетов для phpmyadmin

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz

RUN tar xvzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN mv /usr/share/wordpress /var/www/html

# Выдача прав 

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/

# Создание и дополнение конфигов/ключей для сервера/сайта

COPY ./scrs/create_services.sh ./srcs/initdatabase.sql /
COPY ./srcs/default etc/ngingx/sites-available


