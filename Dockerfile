FROM php:8.0

# Install system dependencies
RUN apt-get update && apt-get install -y \
    zip unzip curl libzip-dev libpng-dev libonig-dev libxml2-dev default-mysql-client \
    && docker-php-ext-install pdo_mysql zip gd bcmath exif

# Install Composer
COPY --from=composer:2.3.5 /usr/bin/composer /usr/bin/composer

WORKDIR /var/www

# Copy only composer files first (for better caching)
COPY composer.json composer.lock ./

# Install dependencies at BUILD time (IMPORTANT)
RUN composer install --no-interaction --prefer-dist --optimize-autoloader

# Now copy rest of application
COPY . .

# Set permissions
RUN chmod -R 775 storage bootstrap/cache

EXPOSE 8000

CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=8000"]




