import re

d1 = 'sou feliz. Muito feliz. As vezes fico triste.'
d2 = 'fico feliz todos os dias. Sou sempre feliz.'
d3 = 'triste. Muito triste. As vezes fico feliz.'
#print(type(d1)) #<class 'str'>

stopwords = ['sou', 'fico', 'as', 'às', 'os', 'todos', 'sempre', 'vezes', 'dias', 'muito'] #criando uma lista com as palavras que devem ser removidas
list_documents = [d1, d2, d3] #irei percorrer esta lista de documentos também
frequencia_termos = {}

#uma string literal é sempre imutável, logo, estes métodos abaixo apenas retornam uma cópia da string com as modificações já realizadas
for i in range(len(list_documents)):
    list_documents[i] = list_documents[i].lower() #convertendo os caracteres do documento para lowercase, quando for possível
    print(list_documents[i])
    for stopword in stopwords:
        list_documents[i] = list_documents[i].replace(stopword, '') #substituindo a ocorrência da stopword por ''
        print(list_documents[i])
    lista_termos = list_documents[i].split(' ') #separando a string em palavras
    lista_termos = [x for x in lista_termos if x != ''] #removendo os elementos em branco da lista
    print(lista_termos)
    for termo in lista_termos:
        #utilizar de regular expressions para remover a pontuação do texto
        termo = re.sub(r'[.,;]', '', termo) #eliminando qualquer traço de pontuação dentro do texto
        print(termo)




