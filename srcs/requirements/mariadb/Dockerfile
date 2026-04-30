FROM debian:12

RUN apt-get update && apt-get install -y mariadb-server mariadb-client galera-4

#RUN mkdir -p /run/mysql && chown -R mysql:mysql /run/mysql && chmod 777 /run/mysql

COPY conf/my.cnf  /etc/mysql/mariadb.conf.d/my.cnf

COPY tools/mydb.sh /mydb.sh

RUN chmod +x /mydb.sh

CMD ["/mydb.sh"]
