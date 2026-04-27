FROM debian:12

RUN apt-get update

RUN apt-get install -y mariadb-server

COPY conf/mydb.cnf  /etc/mysql/mariadb.conf.d/mydb.cnf

COPY tools/mydb.sh /mydb.sh

RUN chmod +x /mydb.sh

CMD ["/mydb.sh"]