FROM nginx
MAINTAINER Wilf Huang "wilf.huang@gtedx.com"

RUN apt-get install python-software-properties
RUN add-apt-repository ppa:ondrej/php
RUN apt-get update -y && apt-get install -y php5-fpm php5-intl php-apc php5-gd php5-intl php5-mysqlnd php5-pgsql php-pear php5-cli curl php5-curl \
  libcurl3 libcurl3-dev && rm -rf /var/lib/apt/lists/*

# Once we start using PHP, it will dictate the use of www-data, so use that instead of nginx
RUN sed -i 's/user  nginx/user  www-data/g' /etc/nginx/nginx.conf

# Force PHP to log to nginx
RUN echo "catch_workers_output = yes" >> /etc/php5/fpm/php-fpm.conf

# Enable php by default
ADD default.conf /etc/nginx/conf.d/default.conf

CMD service php5-fpm start && nginx -g "daemon off;"
