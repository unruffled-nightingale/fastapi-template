from pathlib import Path

import pytest
import requests
from testcontainers.compose import DockerCompose


@pytest.fixture(scope="module")
def docker_dir() -> str:
    return str(Path(__file__).parent.parent.parent)


@pytest.fixture(scope="module")
def compose(docker_dir: str) -> DockerCompose:
    with DockerCompose(docker_dir, build=True) as compose:
        yield compose
        compose.stop()


@pytest.fixture(scope="module")
def url(compose: DockerCompose) -> str:
    host = compose.get_service_host("fastapi_template", 8000)
    port = compose.get_service_port("fastapi_template", 8000)
    return f"http://{host}:{port}"


def test_hello_world(url: str) -> None:
    response = requests.get(url)
    expected = {"message": "Hello World!"}
    assert expected == response.json()
