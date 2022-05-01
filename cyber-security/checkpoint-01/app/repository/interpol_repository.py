import requests


def get_list():
    response = requests.get("https://cspinheiro.github.io/interpol.json")

    get_passport = lambda e: e["interpol"].lower()
    passports = map(get_passport, response.json()["interpol"])

    return list(passports)
