from fastapi import FastAPI

from app.api.routers import main_router
from app.core.config import settings


app = FastAPI()

app.include_router(main_router, prefix='/api/v1')
