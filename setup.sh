#!/bin/bash

echo "🚀 Creating project structure..."

mkdir -p \
.github/workflows \
docker \
infra/terraform \
src/platform/{app,storage,pipelines,databricks,common} \
tests

touch \
.env.example \
.gitignore \
Makefile \
pyproject.toml \
LICENSE

touch docker/Dockerfile
touch .github/workflows/{ci.yml,docker.yml}
touch src/platform/app/{main.py,config.py,logging.py}
touch src/platform/storage/blob.py
touch src/platform/pipelines/sample_pipeline.py
touch src/platform/databricks/job_client.py
touch src/platform/common/exceptions.py
touch tests/test_pipeline.py
touch infra/terraform/{main.tf,storage.tf,variables.tf,outputs.tf}

echo "✅ Project structure created!"
