install:
	poetry check
	poetry install
	poetry run pre-commit install

update:
	poetry update
	poetry run pre-commit update

check:
	poetry run pre-commit run --all-files
