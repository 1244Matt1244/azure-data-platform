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
