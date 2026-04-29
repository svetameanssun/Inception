#BASE IMAGE
FROM debian:12

RUN apt-get update &&\
	apt-get install -y nginx openssl

COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY tools/nginx.sh /nginx.sh

RUN chmod +x /nginx.sh

ENTRYPOINT ["/nginx.sh"]

CMD ["nginx", "-g", "daemon off;"]