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
