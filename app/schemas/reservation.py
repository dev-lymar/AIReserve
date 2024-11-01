from datetime import datetime

from pydantic import BaseModel, field_validator, model_validator


class ReservationBase(BaseModel):
    from_reserve: datetime
    to_reserve: datetime


class ReservationUpdate(ReservationBase):

    @field_validator('from_reserve')
    def check_from_reserve_later_than_now(cls, value):
        if value <= datetime.now():
            raise ValueError(
                'Booking start time cannot be less than the current time'
            )
        return value

    @model_validator(mode="after")
    def check_from_reserve_before_to_reserve(cls, values):
        if values.from_reserve >= values.to_reserve:
            raise ValueError(
                'Booking start time cannot be longer than the end time'
            )
        return values


class ReservationCreate(ReservationUpdate):
    meetingroom_id: int


class ReservationDB(ReservationBase):
    id: int
    meetingroom_id: int

    class Config:
        from_attributes = True
