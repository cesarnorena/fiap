# leitura_anterior = 57521
leitura_anterior = int(input())

# leitura_atual = 57761
leitura_atual = int(input())

consumo_mes = leitura_atual - leitura_anterior
tusd = consumo_mes * 0.40942
te = consumo_mes * 0.38317
pis_pasep = consumo_mes * 0.01
cofins = consumo_mes * 0.0462
total = tusd + te + pis_pasep + cofins

print("Consumo do mês (kWh) = {}".format(consumo_mes))
print("TUSD = R$ {:.2f}".format(tusd))
print("TE = R$ {:.2f}".format(te))
print("PIS/PASEP = R$ {:.2f}".format(pis_pasep))
print("COFINS = R$ {:.2f}".format(cofins))
print("Total a pagar (R$) = {:.2f}".format(total))
