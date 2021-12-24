FROM php:8.0-fpm

# Install system dependencies
RUN apt-get update; \
    apt-get upgrade -y; \
    apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    zip \
    unzip;

# Clear apt cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install php extensions
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd

# Getting the latest Composer version
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

WORKDIR /var/www
