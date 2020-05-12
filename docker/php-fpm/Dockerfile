FROM php:7.4.3-fpm-buster
ARG COMPOSE_PROJECT_NAME

# timezone Taipei
ENV TZ="Asia/Taipei"
RUN ln -snf /usr/share/zoneinfo/${TZ} /etc/localtime && echo ${TZ} > /etc/timezone

# locale zh_TW.UTF-8 ( or ja_JP.UTF-8 or en_US.UTF-8 )
ENV LOCALE="zh_TW"
RUN apt-get update \
    && apt-get install -y locales \
    && echo "${LOCALE}.UTF-8 UTF-8" > /etc/locale.gen \
    && locale-gen \
    && /bin/echo -e "LANG=\"${LOCALE}.UTF-8\"" > /etc/default/local \
    && apt-get clean

# install dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    zlib1g-dev \
    vim \
    # curl
    curl \
    libcurl4 \
    libcurl4-openssl-dev \
    # zip
    libzip-dev \
    zip \
    unzip \
    # gd
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libpng-dev \
    libpng-tools \
    libwebp-dev \
    # imagick
    libmagickwand-dev \
    && rm -rf /var/lib/apt/lists/*

# configure, install and enable all php packages
RUN docker-php-ext-configure gd --with-freetype --with-jpeg --with-webp \
    && docker-php-ext-install -j$(nproc) gd
RUN docker-php-ext-configure zip \
    && docker-php-ext-install -j$(nproc) zip
RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql
RUN docker-php-ext-install -j$(nproc) bcmath
RUN docker-php-ext-install -j$(nproc) opcache
RUN docker-php-ext-install -j$(nproc) exif
RUN pecl install imagick && docker-php-ext-enable imagick

# composer install
RUN curl -sS https://getcomposer.org/installer | php -- --quiet --install-dir=/usr/local/bin --filename=composer
# ref: https://getcomposer.org/doc/faqs/how-to-install-composer-programmatically.md
#RUN EXPECTED_SIGNATURE="$(wget -q -O - https://composer.github.io/installer.sig)" \
#    && php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
#    && ACTUAL_SIGNATURE="$(php -r \"echo hash_file('sha384', 'composer-setup.php');\")" \
#    && [ "${EXPECTED_SIGNATURE}" == "${ACTUAL_SIGNATURE}" ] \
#    && php composer-setup.php --quiet --install-dir=/usr/local/bin --filename=composer \
#    && rm composer-setup.php

# git
#RUN apt-get update \
#  && apt-get install -y git \
#  && apt-get clean

# xdebug
RUN pecl install xdebug-2.9.2 \
    && docker-php-ext-enable xdebug

# redis
#RUN pecl install redis-5.0.0 \
#    && docker-php-ext-enable redis