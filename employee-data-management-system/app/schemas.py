from pydantic import BaseModel

class EmployeeCreate(BaseModel):
    name: str
    age: int
    department: str

class Employee(EmployeeCreate):
    id: int
    class Config:
        orm_mode = True
