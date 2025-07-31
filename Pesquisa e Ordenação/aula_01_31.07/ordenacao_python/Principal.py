from Util import Util
lista_numeros = []
lista2_numeros = []

lista_palavras = []


Util.popular_aleatorio_numeros(lista_numeros, 10, 100, 500)
Util.exibir_lista(lista_numeros)

lista2_numeros.extend(lista_numeros)

Util.popular_aleatorio_palavras(lista_palavras, 10, 6)
Util.exibir_lista(lista_palavras)
