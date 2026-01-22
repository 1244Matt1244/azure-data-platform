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
