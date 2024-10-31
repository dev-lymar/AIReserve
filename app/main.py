from fastapi import FastAPI

from app.api.meeting_room import router
from app.core.config import settings


app = FastAPI()

app.include_router(router)
