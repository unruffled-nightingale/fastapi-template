![Alt Text](./.docs/static/title_image.png)

### A template for building a production ready API using the best current technology, approaches and standards for a backend API in 2022.

## Contents
- [Overview](#Overview)
- [Available scripts](#Overview)

## Overview 
The starter application provides 'out the box':

* **An API web application** (using FastAPI's web framework), which includes:
   * OpenAPI documentation endpoint - `/docs`
   * Health Check endpoint - `/health`
   * Metrics (using OpenTelemetry - not yet implemented)
   * Dashboard for monitoring application (using Grafana - not yet implemented)

* **Tests**
   * Unit (using pytest and Coverage.py)
   * Integration (using pytest, test-containers, and Docker)
   * Acceptance (using pytest)
   * Load (using Locust)
   * Performance (using Scalene - not yet implemented)

* **Code style checks**
   * Linting (using Flake8)
   * Formatting (using black and isort)
   * Static type checking (using mypy)

* **Security checks**
   * File scanning (using bandit)
   * Docker container scanning (using Trivy - not yet implemented)
   * ... some other additional checks

* **CI-CD**
   * All tests, security, and code-style checks run on all pull requests to 'main' branch (using GitHub Actions)
   * Automatic pushing of Docker image on push to 'main' branch (using GitHub Actions and GitHub Container Registry)
   * Automatic deployment to kubernetes using (using GitHub Actions)
   * Schedules acceptance tests to run daily

* **Other**
   * Pre-commit hooks that run unit tests, checks security and code-style checks, and prevents merging to 'main'
   * Pull Request templating to encourage high quality Pull Requests
   * A Makefile that contains all available functionality in the repository

Design documentation is provided that outlines the goals of this repository, as well as the technologies used and the reason for their inclusion (not yet implemented).
___

## Available scripts

All actions that are used in the repository are available in the Makefile.
All pre-commit hooks, GitHub workflows, and build tooling use this Makefile to perform these actions.
This allows for DRY, self-documentation, and easy manual running.

The following Makefile commands are available for this repository:

### `make install`

Installs the application.

### `make update`
Update all the dependencies to the latest available version.

### `make start`
Starts the application.

Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

### `make test-all`
Runs all available tests - unit, integration, acceptance, load, performance

### `make test-unit`
Runs unit tests and build a coverage report

### `make test-integration`
Runs integration tests

### `make test-acceptance`
Runs acceptance tests

### `make check-all`
Runs all code style and security checks

### `make check-format`
Checks formatting

### `make check-poetry`
Checks the lock file is up to date

### `make check-lint`
Checks for any linting errors

### `make check-mypy`
Checks static typing

### `make check-bandit`
Checks for security vulnerabilities in the file.

### `make check-private-keys`
Checks for the any hardcoded string that could be private keys.

### `make check-format`
Checks for any formatting errors

### `make format`
Re-formats all files

### `make docker-build`
Builds docker image of the production app with the name _"fastapi_template"_.

### `make docker-run`

Builds and runs a Docker contains the production app in background mode.
Open [http://localhost:8000](http://localhost:8000) to view it in the browser.

### `make docker-stop`
Stops a Docker container with the name _"fastapi_template"_.

### `make docker-push`
Tags and pushes the most recent Docker image to the GitHub Container Registry

### `make kube-apply`
Applies all kubernetes resource in the ./kube folder.

### `make kube-redeploy`
Re-deploys the _"fastapi_template"_ deployment in kubernetes.

---

# Features not yet implemented

- Add health check
- Add OpenTelemetry metrics
- Add design documentation  
- Add GitHub action to run on template download  
- Add Grafana dashboard
- Add performance testing
- Add CI-CD behaviour on tagging
- Add dev and staging Kubernetes deployments