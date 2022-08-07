# TODO - Update and follow best practices - https://testdriven.io/blog/docker-best-practices/

FROM python:3.10-slim as build

COPY pyproject.toml poetry.lock ./

RUN pip install poetry && \
 poetry config virtualenvs.create false && \
 poetry install --no-dev --no-root


FROM python:3.10-slim

COPY --from=build /usr/local /usr/local
COPY . /app

WORKDIR /app

EXPOSE 8000

ENTRYPOINT ["uvicorn", "fastapi_template.main:app", "--host", "0.0.0.0", "--port", "8000"]