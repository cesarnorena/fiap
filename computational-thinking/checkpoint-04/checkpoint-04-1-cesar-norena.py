import re


def count_words(word):
    return len(re.findall(r"\w+", word))


count_words("Olá.bom.dia")


# %%

def calculate_mean(*args):
    if len(args) == 0:
        return None

    total = 0
    for arg in args:
        total += arg
    return total / len(args)


calculate_mean(2, 4, 8)


# %%

def calculate_max(*args):
    if len(args) == 0:
        return None

    max_number = 0
    for arg in args:
        if arg > max_number:
            max_number = arg
    return max_number


calculate_max(1, 2, 3, 4, 5, 6, 9)


# %%

def calculate_next_digit(cpf):
    multiplier = range((len(cpf) + 1), 1, -1)

    total = 0
    for i, number in enumerate(cpf):
        total += number * multiplier[i]

    digit = 11 - (total % 11)
    return 0 if digit > 9 else digit


def validate_cpf(cpf):
    cpf = [int(char) for char in cpf if char.isdigit()]

    if len(cpf) != 11:
        return False

    if cpf == cpf[::-1]:
        return False

    first = calculate_next_digit(cpf[:9])
    second = calculate_next_digit(cpf[:10])

    return first == cpf[9] and second == cpf[10]


validate_cpf("24053024897")

# %%
