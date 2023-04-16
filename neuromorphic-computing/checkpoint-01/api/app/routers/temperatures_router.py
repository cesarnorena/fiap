from fastapi import APIRouter

router = APIRouter()

@router.get("/temperatures")
def get_temperatures():
    return [
        {"id": 1, "value": 10.0, "created_at": "2021-01-01"}
    ]


@router.get("/temperatures/predictions")
def get_temperatures(days: int = 7):
    return [
        {"id": 1, "value": 10.0, "created_at": "2021-01-01"}
    ]
