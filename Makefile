ifneq (,$(wildcard ./.env))
    include .env
    export
endif

# Docker configurations
DC = docker compose
EXEC = docker exec -it
ENV = --env-file .env
LOGS = docker logs

# Docker Compose files
STORAGES_FILE = docker_compose/storages.yaml
APP_FILE = docker_compose/app.yaml
APP_PROD_FILE = docker_compose/docker-compose.prod.yaml

# Container names
STORAGES_CONTAINER = aireservedb
APP_CONTAINER = aireserve-app
NGINX_CONTAINER = aireserve_nginx


# Targets

.PHONY: app
app: ## Build and run the application with storages
	${DC} -f ${APP_FILE} -f ${STORAGES_FILE} ${ENV} up --build -d

.PHONY: app-logs
app-logs: ## Show application logs
	${LOGS} ${APP_CONTAINER} -f

.PHONY: app-down
app-down: ## Stop the application and storages
	${DC} -f ${APP_FILE} -f ${STORAGES_FILE} down

.PHONY: app-container
app-container: ## Access the application container
	${EXEC} ${APP_CONTAINER} bash

.PHONY: storages
storages: ## Start storage containers only
	${DC} -f ${STORAGES_FILE} ${ENV} up -d

.PHONY: storages-down
storages-down: ## Stop storage containers
	${DC} -f ${STORAGES_FILE} down

.PHONY: postgres
postgres: ## Access Postgres container with psql
	${EXEC} ${STORAGES_CONTAINER} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}

.PHONY: storages-logs
storages-logs: ## Show logs for storage containers
	${LOGS} ${STORAGES_CONTAINER} -f


.PHONY: migrate
migrate: ## Run database migrations
	${EXEC} ${APP_CONTAINER} alembic upgrade head



.PHONY: app-prod
app-prod: ## Build and run the application in production mode
	${DC} -f ${APP_PROD_FILE} ${ENV} up --build -d

.PHONY: app-prod-down
app-prod-down: ## Stop the application in production mode
	${DC} -f ${APP_PROD_FILE} down

.PHONY: nginx-logs
nginx-logs: ## Show logs for Nginx container(Only prod mode)
	${LOGS} ${NGINX_CONTAINER} -f
