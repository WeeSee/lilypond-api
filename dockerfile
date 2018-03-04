# Image source
FROM 1and1internet/ubuntu-16-apache-php-7.0

# Installation de lilypond
RUN apt-get update && apt-get install -y lilypond

# Info image
MAINTAINER ggracieux@gmail.com

# Ajout de la conf apache 
COPY apache/apache.conf /etc/apache2/sites-available/000-default.conf
RUN chmod 777 /etc/apache2/sites-available/000-default.conf

# Ajout de l'api
COPY api /var/www
RUN chown -R www-data /var/www
RUN chmod -R 777 /var/www

# Configuration variables d'environnement
ENV DOCUMENT_ROOT public
ENV UID 33