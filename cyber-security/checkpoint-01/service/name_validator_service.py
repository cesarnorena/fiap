import repository.interpol_repository as repository


def is_name_allowed(name):
    banned_names = repository.get_list()
    return name not in banned_names


is_name_allowed("Cesar")

#%%
