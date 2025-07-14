Laravel 8 CRUD with Docker
This is a Dockerized Laravel 8 CRUD application with a MySQL 5.7 database. The project uses Docker Compose to manage a PHP service (laravel-8-crud-php-1) and a MySQL service (laravel-8-crud-mysql-1). The setup automates dependency installation, database migrations, and server startup using an entrypoint.sh script.
Prerequisites

Docker: Install Docker Desktop (Windows/Mac) or Docker (Linux).
Git: Install Git.
Docker Hub Account: For pulling/pushing the Docker image.
GitHub Account: For cloning the repository.

Project Structure
├── .env.example        # Template for .env file
├── .gitignore          # Git ignore rules
├── Dockerfile          # Builds the PHP service
├── docker-compose.yaml # Defines PHP and MySQL services
├── docker/entrypoint.sh       # Automates setup and startup
├── app/                # Laravel application code
├── public/             # Laravel public directory
├── routes/             # Laravel routes
├── ...

Setup Instructions
1. Clone the Repository
git clone https://github.com/Palak2702/laravel-8-crud.git
cd laravel-8-crud

Replace yourusername with your GitHub username.
2. Configure Environment
Copy .env.example to .env:
cp .env.example .env

Edit .env to set:
APP_KEY= # Run `php artisan key:generate` locally to generate
DB_HOST=mysql
DB_DATABASE=products
DB_USERNAME=palak
DB_PASSWORD=secret

3. Pull or Build the Docker Image

Pull from Docker Hub:docker pull palakk1234/laravel-8-crud-php:latest


Or Build Locally:docker-compose build



4. Run the Application
docker-compose up -d


Access the application at http://localhost:8000.
Check logs:docker logs laravel-8-crud-php-1
docker logs laravel-8-crud-mysql-1



5. Verify Migrations
docker exec -it laravel-8-crud-php-1 bash
php artisan migrate:status

Run migrations manually if needed:
php artisan config:clear
php artisan migrate --force
exit

6. Stop and Clean Up
docker-compose down
docker image prune

Troubleshooting

Connection Refused:

Verify MySQL connection:docker exec -it laravel-8-crud-php-1 bash
mysql -h mysql -u palak -psecret -e "SELECT 1"


Check MySQL logs:docker logs laravel-8-crud-mysql-1




Port Conflict:

If port 3307 is in use, update docker-compose.yaml:ports:
  - "3308:3306"


Restart: docker-compose up -d.


Permission Issues:
docker exec -it laravel-8-crud-php-1 bash
chown -R www-data:www-data /var/www/storage /var/www/bootstrap/cache
chmod -R 775 /var/www/storage /var/www/bootstrap/cache



Docker Hub
The PHP service image is available at palakk1234/laravel-8-crud-php:latest. Pull it with:
docker pull yourusername/laravel-8-crud-php:latest

Notes

Production: Use Nginx with PHP-FPM for better performance.
Security: Replace DB_PASSWORD and MYSQL_ROOT_PASSWORD with stronger passwords.
MySQL: Uses mysql:5.7; consider mysql:8.0 for newer features.

License
MIT License