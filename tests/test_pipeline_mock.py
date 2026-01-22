from unittest.mock import MagicMock
import pytest
from platform.pipelines.sample_pipeline import SamplePipeline

def test_pipeline_mock(monkeypatch):
    # Kreiramo fake BlobClient
    fake_blob = MagicMock()
    # Zamijenimo stvarni BlobClient u sample_pipeline sa fake
    monkeypatch.setattr("platform.pipelines.sample_pipeline.BlobClient", lambda: fake_blob)

    pipeline = SamplePipeline()
    pipeline.run()

    # Provjeri da se upload_text pozvao
    assert fake_blob.upload_text.called
