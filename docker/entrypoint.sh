#!/bin/sh


set -e

# Install dependencies if not installed
if [ ! -f "vendor/autoload.php" ]; then
    composer install --no-progress --no-interaction
fi

# Ensure .env exists
if [ ! -f ".env" ]; then
    echo "Creating env file for env $APP_ENV"
    cp .env.example .env
else
    echo "env file exists."
fi  

echo "Waiting for MySQL..."
for i in {30..0}; do
    if mysqladmin ping -h mysql -u palak -psecret --silent; then
        echo "MySQL is ready!"
        break
    fi
    echo "Waiting for database connection..."
    sleep 2
done

if [ "$i" = 0 ]; then
    echo "ERROR: MySQL connection timed out"
    exit 1
fi

echo "Clearing configuration cache..."
php artisan config:clear
php artisan cache:clear
php artisan route:clear

echo "Running migrations..."
php artisan migrate --force

echo "Starting Laravel server..."
exec php artisan serve --host=0.0.0.0 --port=8000