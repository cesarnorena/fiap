import requests as request


def get_list():
    response = request.get("https://cspinheiro.github.io/interpol.json")
    passports = map(lambda e: e["interpol"], response.json()["interpol"])
    return list(passports)


print(get_list())

# %%
