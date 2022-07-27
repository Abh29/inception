FROM debian:buster

RUN apt update && apt upgrade && apt install -y \
    nodejs npm

RUN mkdir -p /var/www/mycv.42.fr/public && cd /var/www/mycv.42.fr

WORKDIR     /var/www/mycv.42.fr

RUN npm init -y
RUN npm install express --save

COPY tools/server.js   ./server.js
COPY public/*   ./public/

EXPOSE 8081

CMD [ "node", "server.js" ]
