````md
# 🚀 Azure Data Platform

Production-ready Azure data platform template using **Python**, **Docker** and **Terraform**.

---

## Features
- Modular Python architecture
- Azure Blob Storage integration (can be mocked for local development)
- Docker runtime for containerized pipelines
- Infrastructure as Code (Terraform)
- CI pipelines (GitHub Actions)
- Ready for Databricks & API extensions
- Unit tests with mocking (no Azure account required)

---

## Setup

1. Clone the repository:

```bash
git clone https://github.com/1244Matt1244/azure-data-platform.git
cd azure-data-platform
````

2. Install dependencies (Python 3.11+ recommended):

```bash
pip install -e .
# or if no pyproject.toml support
pip install azure-storage-blob pydantic python-dotenv loguru
```

3. Configure environment:

```bash
cp .env.example .env
```

> For local development, dummy values in `.env` are sufficient.
> Real Azure credentials can be added later for actual deployment.

---

## Run locally

```bash
make run
```

* Runs the sample ETL pipeline
* Uses mocked Azure Blob Storage if dummy `.env` values are used
* Logs output to console

---

## Docker

Build Docker image:

```bash
make docker-build
```

Run container:

```bash
make docker-run
```

* Pipeline runs inside Docker
* `.env` file is used for configuration
* No Azure account required for local testing

---

## Infrastructure (Terraform)

> Optional, requires Azure account

```bash
cd infra/terraform
terraform init
terraform apply
```

* Creates Azure Storage account and container
* Can be skipped for local development

---

## Testing

Unit tests use **mocking** for Azure Blob Storage:

```bash
pytest
```

* All pipelines can be tested locally
* No Azure account is needed to run tests

---

## Notes

* Modular and extensible: add new pipelines in `src/platform/pipelines/`
* Mocking allows professional development and testing without cloud dependency
* CI/CD is ready for GitHub Actions
* Docker, Terraform, and Azure integration can be activated anytime with proper credentials

```
