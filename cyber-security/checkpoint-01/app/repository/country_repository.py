import requests as request


def get_list(country: str):
    response = request.get("https://cesarnorena.github.io/aus.json")
    passports = map(lambda e: e[country], response.json()[country])
    return list(passports)
