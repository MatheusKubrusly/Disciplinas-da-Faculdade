import re

d1 = 'sou feliz. Muito feliz. As vezes fico triste.'
d2 = 'fico feliz todos os dias. Sou sempre feliz.'
d3 = 'triste. Muito triste. As vezes fico feliz.'
#print(type(d1)) #<class 'str'>

stopwords = ['sou', 'fico', 'as', 'às', 'os', 'todos', 'sempre', 'vezes', 'dias', 'muito'] #criando uma lista com as palavras que devem ser removidas
list_documents = [d1, d2, d3] #irei percorrer esta lista de documentos também
vetores_frequencia = [{} for _ in range(len(list_documents))]
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
        vetores_frequencia[i][termo] = vetores_frequencia[i].get(termo, 0) + 1 
print(vetores_frequencia)


    


    





    




