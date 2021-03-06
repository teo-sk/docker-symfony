FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y git
RUN apt-get install -y apache2 mysql-server php5 php-apc php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mysqlnd php5-pgsql php5-sqlite php5-xdebug php5-mongo curl acl vim nano

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=bin

ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_PID_FILE     /var/run/apache2.pid
ENV APACHE_RUN_DIR      /var/run/apache2
ENV APACHE_LOCK_DIR     /var/lock/apache2
ENV APACHE_LOG_DIR      /var/log/apache2

RUN a2enmod rewrite

ADD info.php /var/www/html/
ADD php.ini /etc/php5/apache2/
ADD 000-default.conf /etc/apache2/sites-available/

ADD 00_apache /opt/run/
ADD 01_symfony /opt/run/

ADD run_all /opt/bin/
RUN chown -R root:root /opt/
RUN chmod -R +x /opt/run/
RUN chmod +x /opt/bin/run_all

CMD ["/opt/bin/run_all"]

EXPOSE 80
