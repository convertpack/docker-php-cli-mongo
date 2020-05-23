FROM php:cli-alpine

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --quiet && \
    mv composer.phar /usr/local/bin/composer

RUN apk add --no-cache $PHPIZE_DEPS

RUN pecl install mongodb && \
    docker-php-ext-enable mongodb