# Input
salario_bruto = float(input())
numero_dependentes = int(input())
outros_descontos = float(input())

# Calculo INSS
inss = 0

if salario_bruto > 7087.22:
    inss = 828.39
elif 7087.22 >= salario_bruto >= 3641.04:
    inss = salario_bruto * 0.14
elif 3641.03 >= salario_bruto >= 2427.36:
    inss = salario_bruto * 0.12
elif 2427.35 >= salario_bruto >= 1212.01:
    inss = salario_bruto * 0.09
else:
    inss = salario_bruto * 0.075

# Calculo INSS
irrf = 0
inss_base = salario_bruto - inss - numero_dependentes * 189.59

inss_tupla = (0, 0)
if inss_base > 4664.68:
    inss_tupla = (0.275, 869.36)
elif 4664.68 >= inss_base >= 3751.06:
    inss_tupla = (0.225, 636.13)
elif 3751.05 >= inss_base >= 2826.66:
    inss_tupla = (0.15, 354.80)
elif 2826.65 >= inss_base >= 1903.99:
    inss_tupla = (0.075, 142.80)
else:
    inss_tupla = (0, 0)

irrf = (inss_base * inss_tupla[0]) - inss_tupla[1]

# Calculo salário líquido
salario_liquido = salario_bruto - inss - irrf - outros_descontos

# Output
print("Salário bruto = R$ {:.2f}".format(salario_bruto))
print("INSS = R$ {:.2f}".format(inss))
print("IRRF = R$ {:.2f}".format(irrf))
print("Outros descontos = R$ {:.2f}".format(outros_descontos))
print("Salário líquido = R$ {:.2f}".format(salario_liquido))
