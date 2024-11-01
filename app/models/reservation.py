from sqlalchemy import Column, DateTime, ForeignKey, Integer

from app.core.db import Base


class Reservation(Base):
    from_reserve = Column(DateTime)
    to_reserve = Column(DateTime)
    meetingroom_id = Column(Integer, ForeignKey('meetingroom.id'))

    def __repr__(self):
        return f'Already booked from {self.from_reserve} to {self.to_reserve}'
