# Use an official PHP runtime as the base image
FROM php:7.4-apache

# Install the PHP extensions required for MySQL connectivity
RUN docker-php-ext-install mysqli pdo_mysql

# Set the working directory in the container
WORKDIR /var/www/html

# Copy the PHP application files into the container
COPY . /var/www/html

# Expose port 80 to allow external access to your application
EXPOSE 80

# Optionally, you can set environment variables for connecting to the MySQL database
# Replace these values with your actual database credentials
ENV DB_HOST database-2.chftnudp9d1x.us-west-2.rds.amazonaws.com
ENV DB_USER admin
ENV DB_PASS admin1234
ENV DB_NAME sample

# You can optionally use a custom PHP configuration file
# COPY php.ini /usr/local/etc/php/conf.d/

# Optionally, you can run any additional setup commands needed for your application
# For example, you might run composer install or npm install here

# Start the Apache web server when the container starts
CMD ["apache2-foreground"]
