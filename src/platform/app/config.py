from pydantic import BaseSettings

class Settings(BaseSettings):
    azure_storage_connection_string: str
    azure_container_name: str
    env: str = "local"

    class Config:
        env_file = ".env"

settings = Settings()
