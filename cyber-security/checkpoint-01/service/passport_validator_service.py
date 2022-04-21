import repository.country_repository as repository


def is_passport_allowed(passport):
    banned_passports = repository.get_list("aus")
    return passport not in banned_passports


is_passport_allowed(1234)

# %%
