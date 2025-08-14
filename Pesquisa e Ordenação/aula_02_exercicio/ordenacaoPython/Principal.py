from Util import Util
lista_numeros = []
lista2_numeros = []
lista_palavras = []
lista2_palavras = []



Util.popular_aleatorio_numeros(lista_numeros, 10, 100, 500)
print('Lista com números gerados')
Util.exibir_lista(lista_numeros)
print('--------')

Util.popular_aleatorio_palavras(lista_palavras, 10, 6)
print('Lista com palavras geradas')
Util.exibir_lista(lista_palavras)
print('--------')

Util.popular_lista_arquivo(lista2_numeros,"numeros.txt")
print('Lista com números do arquivo .txt')
Util.exibir_lista(lista2_numeros)
print('--------')

Util.popular_lista_arquivo(lista2_palavras,"palavras.txt")
print('Lista com palavras do arquivo .txt')
Util.exibir_lista(lista2_palavras)
print('--------')
