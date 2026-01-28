FROM php:8.0

RUN apt-get update && apt-get install -y \
    zip unzip curl libzip-dev libpng-dev libonig-dev libxml2-dev default-mysql-client \
    && docker-php-ext-install pdo_mysql zip gd bcmath exif

WORKDIR /var/www

COPY . .

COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

# ✅ ADD THIS
RUN chmod +x /var/www/docker/entrypoint.sh

ENV PORT=8000

ENTRYPOINT ["/var/www/docker/entrypoint.sh"]
