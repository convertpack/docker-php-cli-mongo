FROM php:7.3-cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --quiet && \
    mv composer.phar /usr/local/bin/composer && \
    composer self-update --1 && \
    composer clear-cache

RUN apk add --no-cache $PHPIZE_DEPS

RUN pecl install mongodb && \
    docker-php-ext-enable mongodb