_is_registered = False


def get() -> str:
    return 'estou com fome'


def register():
    global _is_registered
    _is_registered = True


def is_registered() -> bool:
    return _is_registered


def is_valid(phrase: str) -> bool:
    return get().lower() == phrase.lower()
