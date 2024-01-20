# Usar la imagen base de PHP 7.2 con Apache
FROM php:7.2-apache

# Instalar Git, zlib, zip, unzip y las extensiones necesarias de PHP
RUN apt-get update && \
    apt-get install -y git zlib1g-dev zip unzip nano && \
    docker-php-ext-install zip && \
    rm -rf /var/lib/apt/lists/*

# Definir 'ServerName' como 'localhost'.
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

# Habilitar 'mod_rewrite'.
RUN a2enmod rewrite

# Instalar Composer 1.10
RUN curl -sS https://getcomposer.org/installer | php -- --version=1.10.22 --install-dir=/usr/local/bin --filename=composer

# Configurar el directorio de trabajo en el contenedor
WORKDIR /var/www/html

# Copiar el código de la aplicación al directorio de trabajo
COPY ./app/src/ /var/www/html/

# Instalar dependencias de PHP con Composer
RUN composer install --no-dev --no-interaction

# Configurar permisos adecuados para el directorio de la aplicación
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Exponer el puerto 80 para acceder a Apache
EXPOSE 80