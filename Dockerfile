FROM runnable/laravel-starter

# Add Repository
ADD [".", "/var/www/"]
WORKDIR /var/www/

# Command to start the app
CMD php artisan migrate && apache2-foreground
