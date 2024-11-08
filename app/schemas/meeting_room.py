from typing import Optional

from pydantic import BaseModel, Field, field_validator



class MeetingRoomBase(BaseModel):
    name: str = Field(None, min_length=1, max_length=100)
    description: Optional[str] = None


class MeetingRoomCreate(MeetingRoomBase):
    name: str = Field(..., min_length=1, max_length=100)


class MeetingRoomUpdate(MeetingRoomBase):

    @field_validator('name')
    def name_cannot_be_null(cls, value):
        if value is None:
            raise ValueError('Room name cannot be empty!')
        return value


class MeetingRoomDB(MeetingRoomBase):
    id: int

    class Config:
        from_attributes = True
