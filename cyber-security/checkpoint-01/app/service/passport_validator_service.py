import app.repository.country_repository as repository


def is_passport_allowed(passport: int):
    banned_passports = repository.get_list("aus")
    return passport not in banned_passports
