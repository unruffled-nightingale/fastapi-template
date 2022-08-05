install:
	poetry install

update:
	poetry update

start:
	uvicorn fastapi_starter.main:app --reload

test:
	pytest -v --cov-config setup.cfg --cov
	coverage xml

check-all: check-poetry check-lint check-mypy check-bandit check-private-keys check-format

check-poetry:
	poetry check

check-lint:
	poetry run flake8 .

check-mypy:
	poetry run mypy --config-file setup.cfg .

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
