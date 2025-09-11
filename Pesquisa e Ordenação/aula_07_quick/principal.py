import time

from util import Util
from ordenacao import Ordenacao

lista_bolha = []
lista_normal = []
lista_selecao = []
lista_insercao = []
lista_agitacao = []
lista_pente = []
lista_shell = []
lista_quick = []
tamanho = 20000

Util.popular_lista_aleatoria(lista_bolha, tamanho, 100, 20000)
lista_normal.extend(lista_bolha) 
lista_selecao.extend(lista_bolha)
lista_insercao.extend(lista_bolha)
lista_agitacao.extend(lista_bolha)
lista_pente.extend(lista_bolha)
lista_shell.extend(lista_bolha)
lista_quick.extend(lista_bolha)
# Util.popular_lista_aleatoria(lista_normal, tamanho, 100, 20000)
# Util.popular_lista_aleatoria(lista_selecao, tamanho, 100, 20000)
# Util.popular_lista_aleatoria(lista_insercao, tamanho, 100, 20000)

#sort
tempoInicio = time.perf_counter()
lista_normal.sort()
tempoFim = time.perf_counter()
tempo_sort = tempoFim - tempoInicio
print("Tempo da rotina ordenar por sort nativo: ",  tempo_sort, "s")        

#bolha
tempoInicio = time.perf_counter()
qtd_comparacoes, qtd_trocas = Ordenacao.bolha(lista_bolha)
tempoFim = time.perf_counter()
tempo_bolha = tempoFim - tempoInicio
print("Tempo da rotina ordenar por bolha: ", tempo_bolha , "s")      
print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  
 

#selecao
tempoInicio = time.perf_counter()
qtd_comparacoes, qtd_trocas = Ordenacao.selecao(lista_selecao)
tempoFim = time.perf_counter()
tempo_selecao = tempoFim - tempoInicio
print("Tempo da rotina ordenar por selecao: ", tempo_selecao , "s")      
print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  

#insercao
tempoInicio = time.perf_counter()
qtd_comparacoes, qtd_trocas = Ordenacao.insercao(lista_insercao)
tempoFim = time.perf_counter()
tempo_insercao = tempoFim - tempoInicio
print("Tempo da rotina ordenar por insercao: ", tempo_insercao , "s")      
print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  
 

# agitacao
tempoInicio = time.perf_counter()
qtd_comparacoes, qtd_trocas = Ordenacao.agitacao(lista_agitacao)
tempoFim = time.perf_counter()
tempo_agitacao = tempoFim - tempoInicio
print("Tempo da rotina ordenar por agitação: ", tempo_agitacao , "s")      
print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  
  

# pente
tempoInicio = time.perf_counter()
qtd_comparacoes, qtd_trocas = Ordenacao.pente(lista_pente)
tempoFim = time.perf_counter()
tempo_pente = tempoFim - tempoInicio
print("Tempo da rotina ordenar por PENTE: ", tempo_pente , "s")      
print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  

# quick
qtd_comparacoes = 0
qtd_trocas= 0
tempoInicio = time.perf_counter()
Ordenacao.quicksort(lista_quick, 0, len(lista_quick) - 1)
tempoFim = time.perf_counter()
print("Tempo da rotina ordenar por QUICK: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', Ordenacao.qtd_comparacoes, '| Trocas:', Ordenacao.qtd_trocas)  
 
