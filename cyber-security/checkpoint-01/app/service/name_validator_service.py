import re

from thefuzz import fuzz
from thefuzz import process

import app.repository.interpol_repository as repository


def is_name_allowed(name: str):
    name = _remove_numbers(name)
    banned_names = repository.get_list()
    return not _match(name.lower(), banned_names)


def _match(text: str, text_list: list):
    result = process.extractOne(text, text_list, scorer=fuzz.WRatio)
    print(result)
    return result[1] > 90


def _remove_numbers(name: str):
    name = re.sub(r"(\b\d+\b)", "", name)
    return re.sub(r"(^\s+)|(\s+$)", "", name)
