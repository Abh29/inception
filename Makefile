

all: volumes build
	docker-compose -f srcs/docker-compose.yml up

build:
	docker-compose -f srcs/docker-compose.yml build

volumes:
	mkdir -p ~/Documents/wordpress ~/Documents/node ~/Documents/DB
	mkdir -p ~/Documents/logs ~/Documents/adminer

clean:
	bash srcs/tools/fclean.sh

ftp-server:
	docker build -t ftptest srcs/requirements/bonus/ftp-server
	docker run --rm -it --env-file srcs/.env --volume wp:/var/www/mehill.42.fr/html -p 21:21 -p 21100-21110:21100-21110 --network inception ftptest


.PHONY: all build volumes clean 