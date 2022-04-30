import requests


def get_list():
    response = requests.get("https://cspinheiro.github.io/interpol.json")
    passports = map(lambda e: e["interpol"].lower(), response.json()["interpol"])
    return list(passports)
