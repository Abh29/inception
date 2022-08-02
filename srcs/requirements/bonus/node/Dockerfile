FROM debian:buster

RUN apt update && apt upgrade && apt install -y \
    nodejs npm

RUN mkdir -p /var/www/mycv.42.fr/html
COPY tools/server.js   /var/www/mycv.42.fr/html/server.js
COPY public/*   /var/www/mycv.42.fr/html/public/


WORKDIR     /var/www/mycv.42.fr/html

RUN npm init -y
RUN npm install express --save

EXPOSE 8081

CMD [ "node", "/var/www/mycv.42.fr/html/server.js" ]
