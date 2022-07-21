FROM debian:buster

LABEL author="mehill"

RUN apt-get update && apt-get install -y \
    nginx openssl

ENV PATH=/usr/local/nginx/bin:$PATH

COPY ./conf/nginx.conf /etc/nginx/conf.d/mehill.conf
COPY ./tools/entrypoint.sh .

RUN chmod +x ./entrypoint.sh

EXPOSE 443

ENTRYPOINT [ "bash", "./entrypoint.sh" ]

# CMD ["nginx", "-g", "daemon off;"]

