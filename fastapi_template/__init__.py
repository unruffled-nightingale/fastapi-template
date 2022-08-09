from pathlib import Path

import toml


def get_version() -> str:
    path = Path(__file__).resolve().parents[1] / "pyproject.toml"
    pyproject = toml.loads(open(str(path)).read())
    version: str = pyproject["tool"]["poetry"]["version"]
    return version


__version__ = get_version()
