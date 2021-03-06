import re

from requests.exceptions import ConnectionError
from thefuzz import fuzz, process

from repository import interpol_repository
from .validator_error import ValidatorError


def is_name_allowed(name: str):
    _validate_name_format(name)

    try:
        banned_names = interpol_repository.get_list()
    except ConnectionError:
        raise ValidatorError("Error de conexão")

    return not _match(name.lower(), banned_names)


def _validate_name_format(name: str):
    if not name:
        raise ValidatorError("Nome precisa ser preenchido")

    if re.search(r"\d+", name):
        raise ValidatorError("Nome não pode conter números")


def _match(text: str, text_list: list):
    result = process.extractOne(text, text_list, scorer=fuzz.WRatio)
    # print([result[1], text, result[0]])
    return result[1] > 89
