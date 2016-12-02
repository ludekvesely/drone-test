FROM atoto/docker-nginx-php-stack

COPY composer.json composer.lock /var/www/html/
COPY app/AppCache.php app/AppKernel.php /var/www/html/app/

RUN composer install --no-dev --no-scripts --optimize-autoloader --ignore-platform-reqs

ADD . /var/www/html

USER root

RUN rm -fr var/* && \
	mkdir -p var var/logs var/temp var/cache && \
	chown -R www-data:www-data /var/www/* && \
	chmod -R 777 var/*

USER www-data

