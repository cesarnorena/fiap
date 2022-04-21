import repository.country_repository as repository


def is_passport_allowed(passport):
    banned_passports = repository.get_list("aus")
    return passport in banned_passports


is_passport_allowed(975066662)

# %%
