#!/bin/sh
set -e

echo "Starting container..."

# Install PHP dependencies if not present
if [ ! -f "vendor/autoload.php" ]; then
    echo "Installing composer dependencies..."
    composer install --no-interaction --prefer-dist --optimize-autoloader
fi

echo "Waiting for MySQL..."
until mysqladmin ping \
    -h "$DB_HOST" \
    -u "$DB_USERNAME" \
    -p"$DB_PASSWORD" \
    --silent; do
    echo "Waiting for database connection..."
    sleep 2
done

echo "Database is ready."   

echo "Clearing caches..."
php artisan config:clear
php artisan route:clear
php artisan cache:clear

echo "Running migrations..."
php artisan migrate --force

echo "Starting Laravel application..."
exec php artisan serve --host=0.0.0.0 --port=8000
