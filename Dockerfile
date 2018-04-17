FROM php:7.0

# Install git (the php image doesn't have it) which is required by composer
RUN apt-get update -yqq && \
    apt-get install git -yqq && \
    apt-get install zlib1g-dev -yqq && \
    apt-get install libsqlite3-dev -yqq && \
    apt-get install libpcre3-dev -yqq && \
    apt-get install libfontconfig1 libxrender1 -yqq

# Install phpunit, the tool that we will use for testing
RUN curl --location --output /usr/local/bin/phpunit https://phar.phpunit.de/phpunit-5.7.phar && \
    chmod +x /usr/local/bin/phpunit

# Install composer global
RUN curl --silent --show-error https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer

# Install mysql driver
# Here you can install any other extension that you need
RUN docker-php-ext-install pdo_mysql zip pdo_sqlite

CMD ["php", "-a"]

