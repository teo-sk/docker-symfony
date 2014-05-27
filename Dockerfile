FROM ubuntu:14.04

RUN apt-get update -y
RUN apt-get install -y apache2 php5 php-apc php5-cli php-pear php5-curl php5-gd php5-imagick php5-intl php5-mysqlnd php5-pgsql php5-sqlite php5-xdebug curl acl

RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=bin

ENV APACHE_RUN_USER     www-data
ENV APACHE_RUN_GROUP    www-data
ENV APACHE_PID_FILE     /var/run/apache2.pid
ENV APACHE_RUN_DIR      /var/run/apache2
ENV APACHE_LOCK_DIR     /var/lock/apache2
ENV APACHE_LOG_DIR      /var/log/apache2

ADD info.php /var/www/html/

ADD 00_apache /opt/run/

ADD run_all /opt/bin/
RUN chown -R root:root /opt/
RUN chmod -R +x /opt/run/
RUN chmod +x /opt/bin/run_all

CMD ["/opt/bin/run_all"]

EXPOSE 80
