import requests

DATA_SOURCE = {
    "bra": "https://cspinheiro.github.io/bra2.json",
    "fra": "https://henricobela.github.io/fra.json",
    "ago": "https://the-icaro.github.io/ago.json",
    "ita": "https://isabellitankian.github.io/ita.json",
    "aus": "https://cesarnorena.github.io/aus.json",
    "ind": "https://eduardomatoss.github.io/ind.json",
    "mng": "https://emgabrielly.github.io/mng.json",
    "can": "https://educunhamxk.github.io/CAN.json",
    "grc": "https://dalcol99.github.io/grc.json",
    "hun": "https://guhdalla.github.io/hun.json",
    "arg": "https://kndhvh.github.io/arg.json",
    "irl": "https://victorswory.github.io/irl.json",
    "npl": "https://rodrigofer89.github.io/npl.json",
    "irq": "https://felps2003.github.io/irq.json",
    "bel": "https://rafael-pereira-silva.github.io/bel.json",
    "nic": "https://rafael-pereira-silva.github.io/bel.json",
    "prt": "https://0verthrive.github.io/prt.json",
    "mdv": "https://jluizgomes.github.io/mdv.json",
    "col": "https://caiogoes.github.io/col.json",
    "hnd": "https://ricardoaugu.github.io/excel-to-json.json",
    "pry": "https://danielthelink.github.io/pry.json",
}


def get_list(country: str):
    url = DATA_SOURCE[country]
    response = requests.get(url)

    get_country = lambda e: str(e[country])
    passports = map(get_country, response.json()[country])

    return list(passports)
