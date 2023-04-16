import requests
from requests.exceptions import HTTPError
from typing import List

class PredictorRepository:

    def __init__(self, base_url) -> None:
        self.base_url = base_url


    def get(self) -> List:
        try:
            response = requests.get(f"{self.base_url}/v1/temperatures")
            response.raise_for_status()
            return response.json()
        
        except HTTPError as error:
            print(error)
            return []
        
        
    def predict(self, days: int) -> List:
        try:
            params = {"days": days}

            response = requests.get(f"{self.base_url}/v1/temperatures/predictions", params=params)
            response.raise_for_status()

            return response.json()

        except HTTPError as error:
            print(error)
            return []
