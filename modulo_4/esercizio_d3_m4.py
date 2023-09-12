# richiesta 1
nome_scuola = "epicode"
indice = 0
while indice < len(nome_scuola):
    carattere = nome_scuola[indice]
    print(carattere)
    indice += 1
# richiesta 2
numero = 0
while numero <= 20:
    print(numero)
    numero += 1
# richiesta 3
potenza = 1
esponente = 0

while esponente <= 10:
    print(f"2^{esponente} = {potenza}")
    potenza *= 2
    esponente += 1
# richiesta 4
N = int(input("Inserisci la potenza di 2 desiderata: "))
potenza = 1
esponente = 0

while esponente <= N:
    print(f"2^{esponente} = {potenza}")
    potenza *= 2
    esponente += 1
# richiesta 5
studenti = ["Alex", "Bob", "Cindy", "Dan", "Emma", "Faith", "Grace", "Henry"]
corsi = ["Cybersecurity", "Data Analyst", "Backend", "Frontend", "Data Analyst", "Backend","Frontend"]
print(len(studenti))
print(len(corsi))

if len(studenti) == len(corsi):
    print("hanno la stessa lunghezza")
else:
    print("non hanno la stessa lunghezza")
# richiesta 6
studenti1 = ["Alex", "Bob", "Cindy", "Dan", "Emma", "Faith", "Grace", "Henry"]
corsi1 = ["Cybersecurity", "Data Analyst", "Backend", "Frontend", "Data Analyst", "Backend"]
corsi1[len(corsi1):] = ["Frontend"]
corsi1[len(corsi1):] = ["Cybersecurity"]
if len(studenti1) == len(corsi1):
    print("hanno la stessa lunghezza")
else:
    print("non hanno la stessa lunghezza")
# richiesta 7
a = input(" scrivi una stringa di almeno sei caratteri: ")
while len(a) < 6:
    a = input("Immetti una stringa con più caratteri:")
if len(a) >= 6:
    print(a[:3] + "..." + a[-3:])
else:
    print("ERRORE")
# richiesta 8
numero = int(input("Inserisci un numero: "))
fattori = []
for i in range(1, numero + 1):
    if numero % i == 0:
        fattori.append(i)
print(f"I fattori di {numero} sono:")
for fattore in fattori:
    print(fattore)