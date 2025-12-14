import re
from math import sqrt, acos, degrees

d1 = 'app funciona app'
d2 = 'app lento app lento'
d3 = 'app usa criptomoeda'
#print(type(d1)) #<class 'str'>

list_documents = [d1, d2, d3] #irei percorrer esta lista de documentos também
frequencia_termos = [{} for _ in range(len(list_documents))]
vetores_frequencia = [[] for _ in range(len(list_documents))]
dicionario_termos = []
lista_termos = [] #estou declarando esta variável fora do for() para poder utilizá-la posteriormente dentro do programa
#uma string literal é sempre imutável, logo, estes métodos abaixo apenas retornam uma cópia da string com as modificações já realizadas
for i in range(len(list_documents)):
    list_documents[i] = list_documents[i].lower() #convertendo os caracteres do documento para lowercase, quando for possível
    lista_termos.append(list_documents[i].split(' ')) #separando a string em palavras e adicionando essa lista de palavras em "lista_termos"
    aux1 = []
    for j in range(len(lista_termos[i])):
        #utilizar de regular expressions para remover a pontuação do texto
        aux1.append(re.sub(r'[.,;]', '', lista_termos[i][j])) #eliminando qualquer traço de pontuação dentro do texto
    lista_termos[i] = aux1

    for termo in lista_termos[i]:
        if termo not in dicionario_termos:
            dicionario_termos.append(termo) #construindo o dicionário todo de forma completa antes de começar a construir os vetores de frequência!

for i in range(len(list_documents)):
    for termo in dicionario_termos:
        frequencia_termos[i][termo] = 0

    #print(lista_termos[i])
    for termo in lista_termos[i]:
        frequencia_termos[i][termo] += 1 

    #print(frequencia_termos[i])
    for value in frequencia_termos[i].values():
        vetores_frequencia[i].append(value)

print(vetores_frequencia)
coordenadas_normalizadas = []
#devemos transformar os vetores existentes em vetores unitários!
for vetor in vetores_frequencia:
    produto_interno = 0
    for pos in vetor:
        produto_interno += (pos**2)
    norma = sqrt(produto_interno)
    vetor = [(pos / norma) for pos in vetor]
    coordenadas_normalizadas.append(tuple(vetor))

#conferindo se os vetores são, de fato, unitários!
i = 0
for vetor in coordenadas_normalizadas:
    produto_interno = 0
    for pos in vetor:
        produto_interno += pos**2
    norma = sqrt(produto_interno)
    i = i + 1
    #considerando apenas os 6 primeiros dígitos da norma, de forma arredondada, logo, 0.9999999999 torna-se 1 quando arredondamos da 6 casa em diante!
    if round(norma, 6) != 1: #considerando um possível erro por conta de truncamento
        print('Erro ao normalizar o vetor')

#agora devemos aplicar a fórmula da "similaridade entre cossenos"
#mediremos o cosseno do ângulo formado entre dois vetores
#quanto mais próximo o cosseno chegar de 0, maior a correlação entre os documentos

#Exemplo: comparando os documentos 1 e 2
vetor_1 = coordenadas_normalizadas[0]
vetor_2 = coordenadas_normalizadas[1] #estes vetores estão no formato de tuplas
coordenadas_1 = [] * len(vetor_1) #criando uma lista de coordenadas de acordo com o tamanho dos vetores
coordenadas_2 = [] * len(vetor_2)
for i in range(len(vetor_1)): #len(vetor_1) é igual a len(vetor_2)
    coordenadas_1.append(vetor_1[i])
    coordenadas_2.append(vetor_2[i])

prodInternoVetores = 0
for i in range(len(coordenadas_1)):
    prodInternoVetores += (coordenadas_1[i] * coordenadas_2[i])

#os vetores já estão normalizados, logo, temos que o produto interno será igual ao cosseno do ângulo entre estes vetores!
print(prodInternoVetores) #cos(theta) = 0.8944271909999159, ou seja, grande proximidade entre o doc1 e o doc2 -> theta é, aproximadamente, 26.568...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 1 e 2: {angle_degrees}")

#Exemplo: comparando os documentos 2 e 3
vetor_1 = coordenadas_normalizadas[1]
vetor_2 = coordenadas_normalizadas[2] #estes vetores estão no formato de tuplas
coordenadas_1 = [] * len(vetor_1) #criando uma lista de coordenadas de acordo com o tamanho dos vetores
coordenadas_2 = [] * len(vetor_2)
for i in range(len(vetor_1)): #len(vetor_1) é igual a len(vetor_2)
    coordenadas_1.append(vetor_1[i])
    coordenadas_2.append(vetor_2[i])

prodInternoVetores = 0
for i in range(len(coordenadas_1)):
    prodInternoVetores += (coordenadas_1[i] * coordenadas_2[i])

#os vetores já estão normalizados, logo, temos que o produto interno será igual ao cosseno do ângulo entre estes vetores!
print(prodInternoVetores) #cos(theta) = 0.8944271909999159, ou seja, grande proximidade entre o doc1 e o doc2 -> theta é, aproximadamente, 26.568...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 2 e 3: {angle_degrees}")

#Exemplo: comparando os documentos 1 e 3
vetor_1 = coordenadas_normalizadas[0]
vetor_2 = coordenadas_normalizadas[2] #estes vetores estão no formato de tuplas
coordenadas_1 = [] * len(vetor_1) #criando uma lista de coordenadas de acordo com o tamanho dos vetores
coordenadas_2 = [] * len(vetor_2)
for i in range(len(vetor_1)): #len(vetor_1) é igual a len(vetor_2)
    coordenadas_1.append(vetor_1[i])
    coordenadas_2.append(vetor_2[i])

prodInternoVetores = 0
for i in range(len(coordenadas_1)):
    prodInternoVetores += (coordenadas_1[i] * coordenadas_2[i])

#os vetores já estão normalizados, logo, temos que o produto interno será igual ao cosseno do ângulo entre estes vetores!
print(prodInternoVetores) #cos(theta) = 0.8944271909999159, ou seja, grande proximidade entre o doc1 e o doc2 -> theta é, aproximadamente, 26.568...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 1 e 3: {angle_degrees}")


    
