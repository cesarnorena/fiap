import requests


def get_list(country: str):
    response = requests.get("https://cesarnorena.github.io/aus.json")
    passports = map(lambda e: str(e[country]), response.json()[country])
    return list(passports)
