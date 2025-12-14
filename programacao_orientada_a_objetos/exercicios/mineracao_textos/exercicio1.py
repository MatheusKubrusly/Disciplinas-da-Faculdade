import re
from math import sqrt, acos, degrees

d1 = 'sou feliz. Muito feliz. As vezes fico triste.'
d2 = 'fico feliz todos os dias. Sou sempre feliz.'
d3 = 'triste. Muito triste. As vezes fico feliz.'
#print(type(d1)) #<class 'str'>

stopwords = ['sou', 'fico', 'as', 'às', 'os', 'todos', 'sempre', 'vezes', 'dias', 'muito'] #criando uma lista com as palavras que devem ser removidas
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
    aux2 = []
    for x in aux1:
        if x not in stopwords:
            aux2.append(x)
    lista_termos[i] = aux2

    for termo in lista_termos[i]:
        if termo not in dicionario_termos:
            dicionario_termos.append(termo)

    for termo in dicionario_termos:
        frequencia_termos[i][termo] = 0

    for termo in lista_termos[i]:
        frequencia_termos[i][termo] += 1 

    for value in frequencia_termos[i].values():
        vetores_frequencia[i].append(value)

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
#quanto mais próximo o cosseno chegar de 0, maior a correlação entre os 

#Exemplo: comparando os documentos 1 e 2
vetor_1 = coordenadas_normalizadas[0]
vetor_2 = coordenadas_normalizadas[1] #estes vetores estão no formato de tuplas
x_1, y_1 = vetor_1
x_2, y_2 = vetor_2
#print((x_1, y_1))
#print((x_2, y_2))
prodInternoVetores = (x_1 * x_2) + (y_1 * y_2) #os vetores já estão normalizados, logo, temos que o produto interno será igual ao cosseno do ângulo entre estes vetores!
#print(prodInternoVetores) #cos(theta) = 0.8944271909999159, ou seja, grande proximidade entre o doc1 e o doc2 -> theta é, aproximadamente, 26.568...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 1 e 2: {angle_degrees}")

#Exemplo: comparando os documentos 2 e 3
vetor_1 = coordenadas_normalizadas[1]
vetor_2 = coordenadas_normalizadas[2] #estes vetores estão no formato de tuplas
x_1, y_1 = vetor_1
x_2, y_2 = vetor_2
#print((x_1, y_1))
#print((x_2, y_2))
prodInternoVetores = (x_1 * x_2) + (y_1 * y_2)
#print(prodInternoVetores) #cos(theta) = 0.4472135954999579, ou seja, doc2 e doc3 não são tão próximos um do outro -> theta é, aproximadamente, 63.442...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 2 e 3: {angle_degrees}")

#Exemplo: comparando os documentos 1 e 3
vetor_1 = coordenadas_normalizadas[0]
vetor_2 = coordenadas_normalizadas[2] #estes vetores estão no formato de tuplas
x_1, y_1 = vetor_1
x_2, y_2 = vetor_2
#print((x_1, y_1))
#print((x_2, y_2))
prodInternoVetores = (x_1 * x_2) + (y_1 * y_2)
#print(prodInternoVetores) #cos(theta) = 0.4472135954999579, ou seja, doc2 e doc3 não são tão próximos um do outro -> theta é, aproximadamente, 63.442...
# 1. Calculate arccosine (Result is in Radians)
angle_radians = acos(prodInternoVetores)
# 2. Convert to Degrees
angle_degrees = degrees(angle_radians)
print(f"Ângulo entre os vetores 1 e 3: {angle_degrees}")



    


    





    




