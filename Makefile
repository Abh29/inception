
all:
	docker-compose -f srcs/docker-compose.yml build && docker-compose -f srcs/docker-compose.yml up