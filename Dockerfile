# Use the official PHP 8.1 image based on Alpine Linux
FROM php:8.1-alpine

# Update and install required packages
RUN apk update && apk add --no-cache \
    git \
    curl \
    zip \
    unzip

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Set the working directory
WORKDIR /app

# Copy and run composer
COPY composer.json composer.lock /app
RUN composer install

# Copy your application files into the container (if needed)
COPY . /app

# Copy the startup script into the container
RUN chmod +x /app/start.sh

# Start the startup script
CMD ["/app/start.sh"]
