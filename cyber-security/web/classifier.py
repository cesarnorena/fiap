from fuzzywuzzy import process as validator

issues = [
    "erro",
    "problema",
    "problemas",
    "pessimo",
    "dor",
    "ruim",
    "pior",
    "horrivel",
    "lixo",
    "trava",
    "sacanagem",
    "instabilidade",
    "raiva",
    "tentando",
    "incorreto",
    "incorretos",
    "nao aceita",
    "nao possui",
    "nao permiti",
    "nao funciona",
    "nao consigo",
    "nao mostra",
    "nao informa",
    "nao passou o cartao",
    "nao obtive resposta",
    "nao tem suporte",
    "app fraco",
    "app horrivel",
    "reclame aqui",
    "fora do ar",
]


def match(text, text_list):
    match_list = validator.extract(text, text_list)

    for word, score in match_list:
        if score >= 55:
            return True

    return False
