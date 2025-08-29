# Use official PHP 8.3 CLI image
FROM php:8.3-cli

# Install system dependencies required by Laravel
RUN apt-get update && apt-get install -y \
    git unzip libzip-dev libonig-dev libxml2-dev curl \
    && docker-php-ext-install pdo pdo_mysql mbstring bcmath zip

# Install Composer
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

# Set working directory
WORKDIR /var/www

# Copy Laravel project
COPY . .

# Install PHP dependencies
RUN composer install --no-dev --optimize-autoloader

# Expose port 8000
EXPOSE 8000

# Run Laravel's built-in server
CMD ["php", "-S", "0.0.0.0:8000", "-t", "public"]
