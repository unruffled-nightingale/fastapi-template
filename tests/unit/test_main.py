from typing import Generator

import pytest
from fastapi.testclient import TestClient

from fastapi_template.main import app


@pytest.fixture(scope="module")
def client() -> Generator[TestClient, None, None]:
    client = TestClient(app)
    yield client


def test_hello_world(client: TestClient) -> None:
    response = client.get("/")
    expected = {"message": "Hello World!"}
    assert expected == response.json()
