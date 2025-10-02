# CÓDIGO EM PYHTON DOS MÉTODOS DE ORDENAÇÃO
```.py
import time
import random
class Ordenacao:
    qtd_comparacoes = 0
    qtd_trocas = 0

    @staticmethod
    def bolha(lista):
        houve_troca = True
        qtd_comparacoes = 0
        qtd_trocas = 0
        while (houve_troca):    
            houve_troca = False
            for i in range (len(lista) - 1):
                qtd_comparacoes+=1
                if (lista[i] > lista[i+1]):
                    qtd_trocas+=1
                    houve_troca = True
                    tmp = lista[i]
                    lista[i] = lista[i+1]
                    lista[i+1] = tmp
                    
        return qtd_comparacoes, qtd_trocas #medem a complexidade do algoritmo
    
    @staticmethod
    def selecao(lista):
        qtd_comparacoes = 0
        qtd_trocas = 0
        for i in range(len(lista) - 1):
            posMenor = i
            for j in range(i+1, len(lista)):
                qtd_comparacoes+=1
                if (lista[j] < lista[posMenor]):
                    posMenor = j
            if (i != posMenor):
                qtd_trocas+=1
                tmp = lista[i]
                lista[i] = lista[posMenor]
                lista[posMenor] = tmp
                
        return qtd_comparacoes, qtd_trocas
    
    
    @staticmethod
    def insercao(lista):
        qtd_comparacoes = 0
        qtd_trocas = 0

        for i in range(1, len(lista)):
            tmp = lista[i]
            for j in range(i - 1, -2, -1):
                qtd_comparacoes+=1
                if (tmp < lista[j]):
                    lista[j + 1] = lista[j]
                    qtd_trocas+=1
                else:
                    break

            lista[j + 1] = tmp
            qtd_trocas+=1
            
        return qtd_comparacoes, qtd_trocas
    
    @staticmethod
    def agitacao(lista):
        ini = 0
        fim = len(lista)
        qtd_comparacoes = 0
        qtd_trocas = 0

        while(True):
            houveTroca = False
            
            for i in range (ini,fim-1):
                qtd_comparacoes+=1
                if (lista[i] > lista[i+1]) :
                    qtd_trocas+=1
                    houveTroca = True
                    tmp = lista[i]
                    lista[i] = lista[i+1]
                    lista[i+1] = tmp
            if (not houveTroca ):
                break  
            fim-=1

            houveTroca = False
            for i in range (fim, ini+1,-1):
                qtd_comparacoes+=1
                if (lista[i] < lista[i-1]) :
                    qtd_trocas+=1
                    houveTroca = True
                    tmp = lista[i]
                    lista[i] = lista[i-1]
                    lista[i-1] = tmp
            ini+=1

            if (not houveTroca ):
                break        
        
        return qtd_comparacoes, qtd_trocas
    
    @staticmethod
    def pente(lista):
        houve_troca = True
        qtd_comparacoes = 0
        qtd_trocas = 0
        distancia = len(lista)

        while(houve_troca or distancia > 1):
            distancia = int(distancia / 1.3)
            houve_troca = False
            if distancia < 1 :
                distancia = 1
            for i in range(0,len(lista) - distancia):
                qtd_comparacoes += 1
                if(lista[i] > lista[i+distancia]):
                    qtd_trocas+=1
                    houve_troca = True
                    tmp = lista[i]
                    lista[i] = lista[i+distancia]
                    lista[i+distancia] = tmp
                           
            return qtd_comparacoes, qtd_trocas

  
    @staticmethod
    def particiona (lista, ini, fim):

        pivo = lista[ini]
        i = ini+1
        j= fim

        while i<=j:
            # anda da esquerda para direita
            while i<= fim and lista[i]<=pivo:
                Ordenacao.qtd_comparacoes +=1
                i+=1


            # anda da direita para esquerda ate achar alguem menor qeu o pivo
            while j> ini and lista[j] > pivo:
                Ordenacao.qtd_comparacoes +=1
                j -= 1

            if i<j:
                Ordenacao.qtd_trocas +=1
                lista[i], lista[j] = lista [j], lista[i]
        # pivo na posicao correta
        Ordenacao.qtd_trocas +=1
        lista[ini], lista[j] = lista[j], lista[ini]

        return j
    
    @staticmethod
    def quicksort(lista,ini, fim):
        if ini<fim:
            pivo = Ordenacao.particiona(lista, ini, fim)
            Ordenacao.quicksort(lista,ini,pivo-1)
            Ordenacao.quicksort(lista, pivo +1, fim)

    @staticmethod
    def heap(vetor, n):
        qtdComparacoes = 0
        qtdTrocas = 0

        while n > 1:
            i = n // 2
            while i > 0:
                qtdComparacoes += 1
                if vetor[i] < vetor[i * 2]:  # comparando raiz com filho da esquerda
                    tmp = vetor[i]
                    vetor[i] = vetor[i * 2]
                    vetor[i * 2] = tmp
                    qtdTrocas += 1

                if i * 2 + 1 <= n:  # só compara filho da direita se existir
                    qtdComparacoes += 1
                    if vetor[i] < vetor[i * 2 + 1]:
                        tmp = vetor[i]
                        vetor[i] = vetor[i * 2 + 1]
                        vetor[i * 2 + 1] = tmp
                        qtdTrocas += 1

                i -= 1

            tmp = vetor[1]
            vetor[1] = vetor[n]
            vetor[n] = tmp
            qtdTrocas += 1
            n -= 1

        return qtdComparacoes, qtdTrocas

class Util:
    @staticmethod
    def popular_lista_aleatoria(lista, quantidade, inicio, fim):
        for _ in range(quantidade):
            lista.append(random.randint(inicio, fim) ) 
            
    @staticmethod
    def exibir_lista(lista, frase):
        print(frase)
        for item in lista:
            print(item)

def main():
    # Lista para cada um dos métodos
    lista_bolha = []
    lista_normal = []
    lista_selecao = []
    lista_insercao = []
    lista_agitacao = []
    lista_pente = []
    lista_shell = []
    lista_quick = []
    lista_heap = []
    tamanho = 20

    # popula um lista e depois 'copia' ela para as demais
    Util.popular_lista_aleatoria(lista_bolha, tamanho, 100, 20000)
    lista_normal.extend(lista_bolha) 
    lista_selecao.extend(lista_bolha)
    lista_insercao.extend(lista_bolha)
    lista_agitacao.extend(lista_bolha)
    lista_pente.extend(lista_bolha)
    lista_shell.extend(lista_bolha)
    lista_quick.extend(lista_bolha)
    lista_heap.extend(lista_bolha)

    # Sort
    tempoInicio = time.perf_counter()
    lista_normal.sort()
    tempoFim = time.perf_counter()
    tempo_sort = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por sort nativo: ",  tempo_sort, "s") 

    # Bolha
    tempoInicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.bolha(lista_bolha)
    tempoFim = time.perf_counter()
    tempo_bolha = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por bolha: ", tempo_bolha , "s")      
    print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)

    # Seleção
    tempoInicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.selecao(lista_selecao)
    tempoFim = time.perf_counter()
    tempo_selecao = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por selecao: ", tempo_selecao , "s")      
    print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas) 

    # Inserção
    tempoInicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.insercao(lista_insercao)
    tempoFim = time.perf_counter()
    tempo_insercao = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por insercao: ", tempo_insercao , "s")      
    print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  
 
    # Agitação
    tempoInicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.agitacao(lista_agitacao)
    tempoFim = time.perf_counter()
    tempo_agitacao = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por agitação: ", tempo_agitacao , "s")      
    print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  
    
    # Pente
    tempoInicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.pente(lista_pente)
    tempoFim = time.perf_counter()
    tempo_pente = tempoFim - tempoInicio
    print("Tempo da rotina ordenar por PENTE: ", tempo_pente , "s")      
    print('Comparacoes:', qtd_comparacoes ,' | Trocas:', qtd_trocas)  

    # ShellSort
    
    # QuickSort
    qtd_comparacoes = 0
    qtd_trocas= 0
    tempoInicio = time.perf_counter()
    Ordenacao.quicksort(lista_quick, 0, len(lista_quick) - 1)
    tempoFim = time.perf_counter()
    print("Tempo da rotina ordenar por QUICK: ", (tempoFim - tempoInicio) , "s")      
    print('Comparacoes:', Ordenacao.qtd_comparacoes, '| Trocas:', Ordenacao.qtd_trocas)  
    
    # HeapSort
    n = len(lista_heap) - 1
    tempo_inicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordenacao.heap(lista_heap, n)
    tempo_fim = time.perf_counter()
    tempo_heap = tempo_fim - tempo_inicio
    print(f'Tempo da rotina ordenar por heap: {tempo_heap:.6f} s')
    print(f'Comparações: {qtd_comparacoes} | Trocas: {qtd_trocas}')

if __name__ == "__main__":
    main()


```
