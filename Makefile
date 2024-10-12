REPOSITORY := ai-rag-template-chat
SHELL := /bin/bash

buildd:
	docker build --network=host \
	-f ./Dockerfile \
	-t ghcr.io/treehousehl/$(REPOSITORY):latest \
	. 

up: 
	docker compose up -d --remove-orphans
	docker compose logs -f 

debug:
	docker compose run -it $(REPOSITORY) bash

down: 
	docker compose --profile "*" down


push: build
	docker push ghcr.io/thewatergategroups/$(REPOSITORY):latest