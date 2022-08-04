FROM python:3.10-slim as build

COPY pyproject.toml poetry.lock ./

RUN poetry config virtualenvs.create false && poetry install --no-root --no-dev -n


FROM python:3.10-slim

WORKDIR /app

COPY --from=build /usr/local usr/local
COPY --chown=app-usr:app-usr . /app

EXPOSE 8000

USER app-usr

CMD ["uvicorn", "fastapi_starter.app:app", "--host", "0.0.0.0", "--port", "8000"]