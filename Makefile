

all: volumes build
	docker-compose -f srcs/docker-compose.yml up

build:
	docker-compose -f srcs/docker-compose.yml build

volumes:
	mkdir -p ~/Documents/wordpress ~/Documents/node ~/Documents/DB
	mkdir -p ~/Documents/logs ~/Documents/adminer ~/Documents/jupyter

clean:
	bash srcs/tools/clean.sh


.PHONY:
	all , 