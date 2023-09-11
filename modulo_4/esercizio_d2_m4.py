#esercizio 1
studenti = "epicode"
print(studenti)
#esercizio 2
nome_scuola = "Epicode"
print(nome_scuola[0])
#esercizio 3
print(nome_scuola[0:3])
#esercizio 4
print(nome_scuola.upper())
#esercizio 5
x = 10
x = (x+2)*3
print(x)
#esercizio 6
a = float(input('scrivi la capacità del serbatoio '))
b = float(input('scrivi efficienza epsressa in km per litro '))
c = 1.80
print(f"Il costo per 100 km è di €{(100/b)*c}")
#esercizio 7
stringa = input("Inserisci una stringa: ")
if len(stringa) >= 3:
    trecaratteri = stringa[:3]
    caratteritre = stringa[-3:]
    risultato = trecaratteri + "..." + caratteritre
    print("Risultato:", risultato)
else:
    print("La stringa inserita è troppo breve per ottenere i primi e gli ultimi 3 caratteri.")
#esercizio 8
a = "Epicode"
b = "Windows"
c = "Excel"
d = "PowerPoint"
e = "Word"
if len(a) >=5 and len(a) <= 8:
    print("Epicode è compresa tra 5 ed 8")
else:
    print("Epicode non è compresa tra 5 e 8")
if len(b) >=5 and len(b) <=8:
    print("Windows è compresa tra 5 ed 8")
else:
    print("Windows non è compresa tra 5 e 8")
if len(c) >= 5 and len(c) <= 8:
    print("Excel è compresa tra 5 ed 8")
else:
    print("Excel non è compresa tra 5 e 8")
if len(d) >= 5 and len(d) <= 8:
        print("PowerPoint è compresa tra 5 ed 8")
else:
        print("PowerPoint non è compresa tra 5 e 8")
if len(e) >= 5 and len(e) <= 8:
        print("Word è compresa tra 5 ed 8")
else:
        print("Word non è compresa tra 5 e 8")
#esercizio 9
a = "knt-S1"
b = "cba-G9"
c = "qtr-Z8"
a_ultimi = a[3:6]
b_ultimi = b[3:6]
c_ultimi = c[3:6]
print(a_ultimi, b_ultimi, c_ultimi)
#esercizio 10
codici = ['knt-S1', "cba-G9", "qtr-Z8"]
for stringa in codici:
    if len(stringa) >= 3:
        ultimi_3_caratteri = stringa[-3:]
        print(f"Gli ultimi 3 caratteri di '{stringa}' sono '{ultimi_3_caratteri}'")
    else:
        print(f"'{stringa}' ha meno di 3 caratteri e non è possibile estrarre gli ultimi 3 caratteri.")

#esercizio 11

titoli_growth = ['tesla', 'shopify', 'block', 'etsy', 'mercadolibre', 'netflix', 'amazon', 'meta platforms', 'salesforce', 'alphabet']
titoli_value = ['pfizer', 'johnson & johnson', 'JPmorgan chase & co.', 'wells fargo & co.', 'verizon communications', 'BP PLC', 'lyondellbasell industries', 'metlife', 'interactive brokers group', 'intel']
titoli_tech = ['apple', 'microsoft', 'alphabet', 'amazon', 'NVIDIA', 'meta platforms', 'tesla', 'alibaba', 'salesforce', 'advanced micro devices', 'intel', 'paypal', 'activision blizzard', 'electronic asrts', 'the trade desk', 'zillow group', 'match group', 'yelp']
titoli_healthcare = ['unitedhealth group', 'johnson  johnson', 'eli lilly  co.', 'novo nordisk', 'merk & co.', 'roche holding', 'pfizer', 'thermo fisher scientific', 'abbott laboratories']
titoli_growth = ['tesla', 'shopify', 'block', 'etsy', 'mercadolibre', 'netflix', 'amazon', 'meta platforms', 'salesforce', 'alphabet']
titoli_tech = ['apple', 'microsoft', 'alphabet', 'amazon', 'NVIDIA', 'meta platforms', 'tesla', 'alibaba', 'salesforce', 'advanced micro devices', 'intel', 'paypal', 'activision blizzard', 'electronic arts', 'the trade desk', 'zillow group', 'match group', 'yelp']
# se si vuole diversificare l'investimento, investendo in aziende growth and value, quali sono le aziende?
titoli_diversificati = titoli_growth + titoli_value
print("Aziende diversificate:")
for titoli in titoli_diversificati:
    print(titoli)
# quali sono le aziende tecnologiche growth?
titoli_tech_growth = list(set(titoli_tech) & set(titoli_growth))
print("aziende tra Tech e Growth:")
for titoli in titoli_tech_growth:
    print(titoli)
# Se vuole investire sia inn aziende tech che value, quali considerarea?
titoli_tech_value = list(set(titoli_tech) & set(titoli_value))
print("aziende tra Tech e value:")
for titoli in titoli_tech_value:
    print(titoli)
# Quali sono i titoli healthcare che non sono value?
titoli_healthcare_notvalue = list(set(titoli_healthcare) - set(titoli_value))
print("aziende healt non value:")
for titoli in titoli_healthcare_notvalue:
    print(titoli)
# Ci sono aziende sia Healthcare sia tech?
titoli_healthcare_tech = list(set(titoli_healthcare) & set(titoli_tech))
if titoli_healthcare_tech:
    print("aziende tech & value:")
    for titoli in titoli_healthcare_tech:
        print(titoli)
else:
    print("non ci sono corrispondenze.")
# In quali si deve investire se si vuole aziende tech ma solo growth o value?
aziende_techvalue_o_growth = []

for azienda in titoli_tech:
    if azienda in titoli_value:
        aziende_techvalue_o_growth.append(azienda)

for azienda in titoli_growth:
    if azienda not in aziende_techvalue_o_growth:
        aziende_techvalue_o_growth.append(azienda)

print("Aziende Tech growth o value:")
for azienda in aziende_techvalue_o_growth:
    print(azienda)

