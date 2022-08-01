install:
	poetry install
	pre-commit install

update:
	poetry update
	pre-commit update

check:
	pre-commit run --all-files
