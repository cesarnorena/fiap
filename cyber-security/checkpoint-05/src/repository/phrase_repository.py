is_registered = False


def get() -> str:
    return 'estou com fome'


def register():
    global is_registered
    is_registered = True


def is_registered() -> bool:
    return is_registered


def is_valid(phrase: str) -> bool:
    return get().lower() == phrase.lower()
