# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: sabra <marvin@42.fr>                       +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2020/12/19 12:44:55 by sabra             #+#    #+#              #
#    Updated: 2021/04/11 10:22:48 by sabra            ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

# Установка необходимых пакетов в образе

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install nginx default-mysql-server php7.3-fpm \
php7.3-mysql wordpress php-mbstring openssl vim 

# Скачивание и установка дополнительных пакетов для phpmyadmin

ADD https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.tar.gz phpmyadmin.tar.gz

RUN tar xvzf phpmyadmin.tar.gz && mv phpMyAdmin-5.0.2-all-languages /var/www/html/phpmyadmin
RUN mv /usr/share/wordpress /var/www/html
# Создание и дополнение конфигов/ключей для сервера/сайта

COPY ./srcs/create_services.sh ./srcs/autoindex.sh /
COPY ./srcs/default /etc/nginx/sites-available/
COPY ./srcs/init_database.sql /var/
COPY ./srcs/config.inc.php /var/www/html/phpmyadmin/
COPY ./srcs/wp-config.php /var/www/html/wordpress/ 

# Получение сертификата и ключа ssl для сайта

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 63 -nodes -verbose -out /etc/ssl/certs/sabra.crt -keyout /etc/ssl/private/sabra.key -subj "/C=RU/ST=Moscow/L=Moscow/O=42 School/OU=sabra/CN=html"

# Выдача прав на управление сервером. -R - флаг рекурсивного присваения прав

RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 777 /var/www/
RUN chmod +x create_services.sh
RUN chmod +x autoindex.sh

# Открываем 80 и 443 порты

EXPOSE 80 443

RUN service mysql start && mysql < /var/init_database.sql

ENTRYPOINT bash create_services.sh
