from typing import Optional

from pydantic import BaseModel, Field



class MeetingRoomBase(BaseModel):
    name: str = Field(..., min_length=1, max_length=100)
    description: Optional[str] = None


class MeetingRoomCreate(MeetingRoomBase):
    ...


class MeetingRoomDB(MeetingRoomBase):
    id: int

    class Config:
        from_attributes = True
