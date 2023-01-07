FROM httpd
RUN apt-get update
ADD index.html /usr/local/apache2/htdocs
