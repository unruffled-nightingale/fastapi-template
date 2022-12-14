install:
	poetry install

update:
	poetry update

start:
	uvicorn fastapi_template.main:app --reload

test-all: test-acceptance test-integration test-unit

test-unit:
	pytest tests/unit -v --cov-config pyproject.toml --cov
	coverage xml --fail-under 90

test-integration:
	pytest tests/integration -v --cov-config pyproject.toml

test-acceptance:
	APPLICATION_URL=https://fastapi-template.unruffled-nightingale.com/ pytest tests/acceptance

test-load:
	locust -f ./tests/load/test_main.py --users 10 --spawn-rate 1 -H https://fastapi-template.unruffled-nightingale.com/

check-all: check-poetry check-lint check-mypy check-bandit check-private-keys check-format

check-poetry:
	poetry check

check-lint:
	poetry run flake8 .

check-mypy:
	poetry run mypy --config-file pyproject.toml .

check-bandit:
	poetry run bandit -r -q . --exclude /tests

check-private-keys:
	poetry run detect-private-key

check-format:
	poetry run isort --check-only --diff .
	poetry run black --check --diff .

format:
	poetry run black .
	poetry run isort .
	poetry run end-of-file-fixer
	poetry run trailing-whitespace-fixer

docker-build:
	docker build -t fastapi_template .

docker-run: docker-build
	docker run -p 8000:8000 -d fastapi_template

docker-stop:
	docker stop $(shell docker ps -aqf "ancestor=fastapi_template")

docker-push: docker-build
	docker tag fastapi_template ghcr.io/unruffled-nightingale/fastapi_template:latest
	docker push ghcr.io/unruffled-nightingale/fastapi_template:latest

kube-apply:
	kubectl apply -f .kube/service.yml
	kubectl apply -f .kube/ingress.yml
	kubectl apply -f .kube/deployment.yml

kube-redeploy:
	kubectl rollout restart deployment fastapi-template