
MKDIR= sudo mkdir -p
RM = sudo rm -rf

all : up

up :
	$(MKDIR) /home/mozennou/data/wp
	$(MKDIR) /home/mozennou/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up

up_build :
	$(MKDIR) /home/mozennou/data/wp
	$(MKDIR) /home/mozennou/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build

down :
	docker compose -f ./srcs/docker-compose.yml down

fclean :
	docker compose -f ./srcs/docker-compose.yml down --rmi all

fclean_volumes :
	docker compose -f ./srcs/docker-compose.yml down --rmi all --volumes
	$(RM) /home/mozennou/data/wp/*
	$(RM) /home/mozennou/data/mariadb/*

clean_stopped:
	docker compose -f ./srcs/docker-compose.yml rm

re : fclean
	$(MKDIR) /home/mozennou/data/wp
	$(MKDIR) /home/mozennou/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build

re_volumes : fclean_volumes
	$(MKDIR) /home/mozennou/data/wp
	$(MKDIR) /home/mozennou/data/mariadb
	docker compose -f ./srcs/docker-compose.yml up --build
