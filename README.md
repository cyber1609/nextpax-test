In order to install the project you have to:
docker-compose up -d
docker-compose exec nextpax composer install
docker-compose exec nextpax php artisan db:seed --class=DatabaseSeeder
Your app should be available at localhost:80