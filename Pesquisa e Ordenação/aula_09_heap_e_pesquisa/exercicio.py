"""
programa que:
    - armazene milhoes de números inteiros pouco repetidos (desordenado)
    - localize o menor número gerado
    - retorne o número
    - temporize esse processamento
    - contabilize o número de comparações
  
"""
import random
import time

class ordenacao:
    @staticmethod
    def localiza_menor(lista):
        lista.sort()
        menor = lista[0]
        return menor
    
    def comparacoes(lista):
        contador = 0
        menor = 100000
        for i in range (len(lista)):
            if lista[i] < menor:
                menor = lista[i]
                contador +=1

        return contador, menor

def main():
    tamanho = 100
    intervalo = (1,101)
    lista = random.sample(range(intervalo[0],intervalo[1]),tamanho)
    lista1=[]
    lista1.extend(lista) 

    tempoInicio = time.perf_counter()
    menor = ordenacao.localiza_menor(lista)
    print (f'o menor número é : {menor}')
    tempoFim = time.perf_counter()
    tempo = tempoFim - tempoInicio
    print("Tempo = : ", tempo , "s")      
   
    print ('-------------')

    tempoInicio = time.perf_counter()
    qtd_comparacoes,meno = ordenacao.comparacoes(lista1)
    tempoFim = time.perf_counter()
    tempo = tempoFim - tempoInicio
    print (f'o menor número é : {meno}')
    print("Tempo = : ", tempo , "s")      
    print(f'foram feitas {qtd_comparacoes} comparações')




if __name__ == "__main__":
    main()

