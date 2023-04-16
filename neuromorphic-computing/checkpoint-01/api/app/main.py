from fastapi import FastAPI
from app.routers.temperatures_router import router as temperatures_router
from app.database import engine

import os
import logging.config

# Get the absolute path of the parent directory of the current file
parent_dir = os.path.abspath(os.path.join(os.path.dirname(__file__), '..'))

# Load the logging configuration file from the parent directory
logging_config_file = os.path.join(parent_dir, 'config/logging.ini')
logging.config.fileConfig(logging_config_file, disable_existing_loggers=False)

app = FastAPI()

app.state.database = engine

@app.get("/")
def read_root():
    return {"message": "Hello World!"}


app.include_router(temperatures_router, prefix="/api/v1")
