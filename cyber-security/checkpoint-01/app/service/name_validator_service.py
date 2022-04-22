from thefuzz import fuzz
from thefuzz import process

import app.repository.interpol_repository as repository


def is_name_allowed(name: str):
    banned_names = repository.get_list()
    return not _match(name, banned_names)


def _match(text: str, text_list: list):
    result = process.extractOne(text, text_list, scorer=fuzz.WRatio)
    print(result)
    return result[1] > 90
