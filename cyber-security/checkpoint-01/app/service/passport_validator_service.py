import re

from .validator_error import ValidatorError
from repository import country_repository as repository


def is_passport_allowed(passport: str):
    _validate_passport_format(passport)

    country, number = _split_passport(passport)

    try:
        banned_passports = repository.get_list(country)
    except ConnectionError:
        raise ValidatorError("Error de conexão")

    return number not in banned_passports


def _validate_passport_format(passport: str):
    if not passport:
        raise ValidatorError("Passaporte precisa ser preenchido")

    if re.match(r"\W+", passport):
        raise ValidatorError("Passaporte não pode ter caracteres especiais")

    if not re.match(r"^(\w{3}\d{9})$", passport):
        raise ValidatorError("Passaporte com formato errado")


def _split_passport(passport: str):
    return re.match(r"(\w{3})(\d{9})", passport).groups()
