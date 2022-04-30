import re

import repository.interpol_repository as repository
from thefuzz import fuzz
from thefuzz import process


def is_name_allowed(name: str):
    _validate_name_format(name)

    banned_names = repository.get_list()
    return not _match(name.lower(), banned_names)


def _validate_name_format(name: str):
    if not name:
        raise ValueError("Nome precisa ser preenchido")

    if re.search(r"\d+", name):
        raise ValueError("Nome não pode conter números")


def _match(text: str, text_list: list):
    result = process.extractOne(text, text_list, scorer=fuzz.WRatio)

    print(result)
    return result[1] > 90
