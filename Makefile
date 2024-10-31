ifneq (,$(wildcard ./.env))
    include .env
    export
endif

DC = docker compose
STORAGES_FILE = docker_compose/storages.yaml
EXEC = docker exec -it
DB_CONTAINER = aireservedb
LOGS = docker logs
ENV = --env-file .env


.PHONY: app
app:
	uvicorn app.main:app --reload

.PHONY: storages
storages:
	${DC} -f ${STORAGES_FILE} ${ENV} up -d

.PHONY: storages-down
storages-down:
	${DC} -f ${STORAGES_FILE} down

.PHONY: postgres
postgres:
	${EXEC} ${DB_CONTAINER} psql -U ${POSTGRES_USER} -d ${POSTGRES_DB}

.PHONY: storages-logs
storages-logs:
	${LOGS} ${DB_CONTAINER} -f
