FROM alpine:latest

RUN apk update && apk upgrade

RUN apk add nginx php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-pdo php7-fileinfo php7-dom php7-xml php7-zip php7-xmlwriter php7-tokenizer openrc

RUN rc-update add nginx default

RUN rc-update add php-fpm7 default

RUN apk add --update nodejs npm composer

RUN npm install -g yarn

RUN mkdir /app

COPY . /app

WORKDIR /app

RUN composer install --no-dev --no-cache && yarn install