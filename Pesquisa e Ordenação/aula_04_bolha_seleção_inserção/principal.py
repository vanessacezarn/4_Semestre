from util import Util
from ordenacao import Ordenacao
import time
 
lista_bolha = [7, 1, 4, 2, 3, 9,8 ]
lista_normal = [7, 1, 4, 2, 3, 9,8 ]
lista_selecao = [7, 1, 4, 2, 3, 9,8 ]
lista_insercao =[7, 1, 4, 2, 3, 9,8 ]
lista_agitacao =[7, 1, 4, 2, 3, 9,8 ]
lista_pente =[7, 1, 4, 2, 3, 9,8 ]

#Util.popular_lista_aleatoria(lista_bolha, 10000, 100, 20000)
#Util.popular_lista_aleatoria(lista_normal, 10000, 100, 20000)
#Util.popular_lista_aleatoria(lista_selecao, 10000, 100, 20000)
#Util.popular_lista_aleatoria(lista_insercao, 10000, 100, 20000)


tempoInicio = time.time()
lista_normal.sort()
tempoFim = time.time()
#Util.exibir_lista(lista_normal,"vetor ordenado por sort nativo")
print("Tempo da rotina ordenar por sort nativo: ", (tempoFim - tempoInicio) , "s")        
 

tempoInicio = time.time()
qtd_comparacoes, qtd_trocas = Ordenacao.bolha(lista_bolha)
tempoFim = time.time()
#Util.exibir_lista(lista_bolha,"vetor ordenado por BOLHA")
print("Tempo da rotina ordenar por bolha: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', qtd_comparacoes, '| Trocas:', qtd_trocas)  
  

tempoInicio = time.time()
qtd_comparacoes, qtd_trocas = Ordenacao.selecao(lista_selecao)
tempoFim = time.time()
#Util.exibir_lista(lista_selecao,"vetor ordenado por seleção")
print("Tempo da rotina ordenar por selecao: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', qtd_comparacoes, '| Trocas:', qtd_trocas)  

tempoInicio = time.time()
qtd_comparacoes, qtd_trocas = Ordenacao.insercao(lista_insercao)
tempoFim = time.time()
#Util.exibir_lista(lista_insercao,"vetor ordenado por INSERÇÃO")
print("Tempo da rotina ordenar por INSERÇÃO: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', qtd_comparacoes, '| Trocas:', qtd_trocas)  
 
# AGITAÇÃO
tempoInicio = time.time()
qtd_comparacoes, qtd_trocas = Ordenacao.agitacao(lista_agitacao)
tempoFim = time.time()
print("Tempo da rotina ordenar por AGITAÇÃO: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', qtd_comparacoes, '| Trocas:', qtd_trocas)  
 
 
# PENTE
tempoInicio = time.time()
qtd_comparacoes, qtd_trocas = Ordenacao.pente(lista_pente)
tempoFim = time.time()
print("Tempo da rotina ordenar por PENTE: ", (tempoFim - tempoInicio) , "s")      
print('Comparacoes:', qtd_comparacoes, '| Trocas:', qtd_trocas)  
 





