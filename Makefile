all:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

down:
	@docker compose -f ./srcs/docker-compose.yml down

re:
	@docker compose -f ./srcs/docker-compose.yml up -d --build

clean:
	@docker stop $$(docker ps -aq);\
	docker rm $$(docker ps -aq);\
	docker rmi -f $$(docker images -aq);\
	docker volume rm $$(docker volume ls -q);\
	docker network rm srcs_docker-network;\
	docker system prune -a --force;\
