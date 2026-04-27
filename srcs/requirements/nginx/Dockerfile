#BASE IMAGE
FROM debian:12

RUN apt-get update &&\
	apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/nginx.sh /ngnix.sh

RUN chmod +x /ngnix.sh

ENTRYPOINT ["/ngnix.sh"]

CMD ["nginx", "-g", "daemon off;"]