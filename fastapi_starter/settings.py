from functools import lru_cache

from pydantic import BaseSettings

from fastapi_starter import __version__


class Settings(BaseSettings):
    version: str = "0.1.0"
    release_id: str = __version__
    description: str = "FastAPI starter template"


@lru_cache()
def get_settings() -> Settings:
    return Settings()
