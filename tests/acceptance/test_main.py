import os
from typing import Optional

import pytest
import requests


@pytest.fixture(scope="module")
def url() -> Optional[str]:
    return os.environ.get("APPLICATION_URL")


def test_hello_world(url: str) -> None:
    response = requests.get(url)
    expected = {"message": "Hello World!"}
    assert expected == response.json()
