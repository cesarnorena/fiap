from sqlalchemy import Column, Integer, String
from app.database import Base

class Temperature(Base):
    __tablename__ = "temperatures"
    
    id = Column(Integer, primary_key=True, index=True)
    value = Column(Integer)
    create_at = Column(String)