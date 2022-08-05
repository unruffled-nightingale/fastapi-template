from fastapi.testclient import TestClient

from fastapi_starter.main import app

client = TestClient(app)


def test_hello_world():
    response = client.get("/")
    expected = {"message": "Hello World!"}
    assert expected == response.json()
