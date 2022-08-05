NAME=fastapi_starter
VERSION=$(shell git rev-parse HEAD)

install:
	poetry install

update:
	poetry update

start:
	uvicorn fastapi_starter.main:app --reload

test-all: test-unit test-integration

test-unit:
	pytest tests/unit -v --cov-config pyproject.toml --cov
	coverage xml

test-integration:
	pytest tests/integration -v --cov-config pyproject.toml

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
	docker build -t $(NAME):latest .

docker-run: docker-build
	docker run -p 8000:8000 -d $(NAME):latest
