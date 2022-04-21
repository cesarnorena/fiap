from thefuzz import fuzz
from thefuzz import process

import repository.interpol_repository as repository


def is_name_allowed(name):
    banned_names = repository.get_list()
    return not match(name, banned_names)


def match(text, text_list):
    result = process.extractOne(text, text_list, scorer=fuzz.WRatio)

    print(result)
    return result[1] > 90


is_name_allowed("ricardo silva leo")
