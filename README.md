# 🚀 Azure Data Platform

Production-ready Azure data platform template using Python, Docker and Terraform.

## Features
- Modular Python architecture
- Azure Blob Storage integration
- Docker runtime
- Infrastructure as Code (Terraform)
- CI pipelines
- Ready for Databricks & API extensions

## Run locally

cp .env.example .env
make run

## Docker

make docker-build
make docker-run

## Infrastructure

cd infra/terraform
terraform init
terraform apply
