class DatabricksJobClient:
    def run_job(self, job_id: str):
        print(f"Triggering Databricks job: {job_id}")
