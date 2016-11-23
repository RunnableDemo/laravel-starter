FROM php:7.0-apache

# Packages
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libbz2-dev \
    libxslt-dev \
    libssl-dev \
    libcurl4-openssl-dev \
    pkg-config \
    libldap2-dev \
    php-pear \
    curl \
    git \
    subversion \
    unzip \
    wget \
  && rm -r /var/lib/apt/lists/*

# PHP Extensions
RUN docker-php-ext-install bcmath mcrypt zip bz2 mbstring pcntl xsl \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd \
  && docker-php-ext-configure ldap --with-libdir=lib/x86_64-linux-gnu/ \
  && docker-php-ext-install ldap \
  && docker-php-ext-install pdo_mysql

# Setup the Composer installer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Enable Rewrite Module
RUN a2enmod rewrite

# Add Repository
ADD [".", "/var/www/"]
WORKDIR /var/www/
RUN composer install

# Apply proper file-access permissions for Apache2
RUN rmdir /var/www/html/
RUN ln -s /var/www/public /var/www/html
RUN chown -R www-data /var/www/
RUN chgrp -R www-data /var/www/
RUN chmod -R 775 /var/www/storage

# Open up ports on the container
EXPOSE 80

# Command to start the app
CMD php artisan migrate && apache2-foreground
