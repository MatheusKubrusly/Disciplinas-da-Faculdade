import re

d1 = 'sou feliz. Muito feliz. As vezes fico triste.'
d2 = 'fico feliz todos os dias. Sou sempre feliz.'
d3 = 'triste. Muito triste. As vezes fico feliz.'
#print(type(d1)) #<class 'str'>

stopwords = ['sou', 'fico', 'as', 'às', 'os', 'todos', 'sempre', 'vezes', 'dias', 'muito'] #criando uma lista com as palavras que devem ser removidas
list_documents = [d1, d2, d3] #irei percorrer esta lista de documentos também
frequencia_termos_docs = []
dicionario_termos = []
lista_termos = [[] for _ in range(len(list_documents))] #estou declarando esta variável fora do for() para poder utilizá-la posteriormente dentro do programa
#uma string literal é sempre imutável, logo, estes métodos abaixo apenas retornam uma cópia da string com as modificações já realizadas
for i in range(len(list_documents)):
    list_documents[i] = list_documents[i].lower() #convertendo os caracteres do documento para lowercase, quando for possível
    lista_termos[i] = list_documents[i].split(' ') #separando a string em palavras
    for j in range(len(lista_termos)):
        #utilizar de regular expressions para remover a pontuação do texto
        lista_termos[i][j] = re.sub(r'[.,;]', '', lista_termos[i][j]) #eliminando qualquer traço de pontuação dentro do texto
    for stopword in stopwords:
        lista_termos[i] = [x for x in lista_termos if x != stopword] #removendo os elementos em branco da lista
    
    #já alcançamos uma lista com os termos do documento já desconsiderando as stopwords!
    #na realidade, o que devo fazer é criar um dicionário de todos os termos e depois percorrer a lista de termos de cada arquivo para poder ver a frequência dos termos
    for termo in lista_termos[i]:
        if termo not in dicionario_termos:
            dicionario_termos.append(termo)

#agora que já temos o dicionário de termos, podemos calcular a frequência dos termos para cada documento
for termo in lista_termos[i]:
    #...
    


    





    




