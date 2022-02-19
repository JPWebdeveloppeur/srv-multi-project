up: ## Run container
	docker-compose -f docker-compose.yml start
	docker-compose -f srv_employee/docker-compose.yml start
	docker-compose -f srv_client/docker-compose.yml start
	docker-compose -f goacar-bo/docker-compose.yml start

down: ## Stop container
	docker-compose -f docker-compose.yml stop
	docker-compose -f srv_employee/docker-compose.yml stop
	docker-compose -f srv_client/docker-compose.yml stop
	docker-compose -f goacar-bo/docker-compose.yml stop

