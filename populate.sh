#!/bin/bash

echo "🚀 Populating project with code..."

# --- src/platform/app ---
cat > src/platform/app/main.py << 'EOF'
from platform.app.logging import setup_logging
from platform.pipelines.sample_pipeline import SamplePipeline

logger = setup_logging()

def main():
    logger.info("Starting Azure Data Platform")
    pipeline = SamplePipeline()
    pipeline.run()
    logger.info("Finished successfully")

if __name__ == "__main__":
    main()
EOF

cat > src/platform/app/config.py << 'EOF'
from pydantic import BaseSettings

class Settings(BaseSettings):
    azure_storage_connection_string: str
    azure_container_name: str
    env: str = "local"

    class Config:
        env_file = ".env"

settings = Settings()
EOF

cat > src/platform/app/logging.py << 'EOF'
from loguru import logger
import sys

def setup_logging():
    logger.remove()
    logger.add(
        sys.stdout,
        level="INFO",
        format="{time} | {level} | {message}",
    )
    return logger
EOF

# --- src/platform/storage ---
cat > src/platform/storage/blob.py << 'EOF'
from azure.storage.blob import BlobServiceClient
from platform.app.config import settings

class BlobClient:
    def __init__(self):
        self.client = BlobServiceClient.from_connection_string(
            settings.azure_storage_connection_string
        )
        self.container = self.client.get_container_client(
            settings.azure_container_name
        )

    def upload_text(self, path: str, content: str):
        blob = self.container.get_blob_client(path)
        blob.upload_blob(content, overwrite=True)

    def download_text(self, path: str) -> str:
        blob = self.container.get_blob_client(path)
        return blob.download_blob().readall().decode("utf-8")

    def list_files(self):
        return [blob.name for blob in self.container.list_blobs()]
EOF

# --- src/platform/pipelines ---
cat > src/platform/pipelines/sample_pipeline.py << 'EOF'
from platform.storage.blob import BlobClient
from loguru import logger

class SamplePipeline:
    def __init__(self):
        self.blob = BlobClient()

    def run(self):
        logger.info("Running sample ETL pipeline")
        raw_text = "hello from azure data platform"
        self.blob.upload_text("raw/input.txt", raw_text)

        downloaded = self.blob.download_text("raw/input.txt")
        transformed = downloaded.upper()
        self.blob.upload_text("processed/output.txt", transformed)

        logger.info("Pipeline completed successfully")
EOF

# --- src/platform/databricks ---
cat > src/platform/databricks/job_client.py << 'EOF'
class DatabricksJobClient:
    def run_job(self, job_id: str):
        print(f"Triggering Databricks job: {job_id}")
EOF

# --- src/platform/common ---
cat > src/platform/common/exceptions.py << 'EOF'
class PlatformException(Exception):
    pass
EOF

# --- tests ---
cat > tests/test_pipeline.py << 'EOF'
def test_uppercase_transform():
    text = "hello"
    assert text.upper() == "HELLO"
EOF

echo "✅ All files populated!"
