class Ordenacao:
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
                    
        return qtd_comparacoes, qtd_trocas
    
    @staticmethod
    def selecao(lista):
        qtd_comparacoes = 0
        qtd_troca=0
        posMenor = 0
        for i in range(len(lista)-1):
            posMenor == i
            for j in range (i+1,len(lista)): 
                qtd_comparacoes +=1
                if(lista[j]<lista[posMenor]):
                     posMenor = j
            
            if(i != posMenor):
                qtd_troca +=1
                tmp = lista[i]
                lista[i] = lista[posMenor]
                lista[posMenor] = tmp

        return qtd_comparacoes, qtd_troca

    @staticmethod
    def insercao(lista):
        qtd_comparacoes = 0
        qtd_trocas = 0

        for i in range(1, len(lista)):
            tmp = lista[i]
            j = i - 1

            while j >= 0:
                qtd_comparacoes += 1
                if tmp < lista[j]:
                    lista[j + 1] = lista[j]  # shift
                    qtd_trocas += 1
                    j -= 1
                else:
                    break

            lista[j + 1] = tmp
            # conta a "inserção final" do tmp como uma troca
            qtd_trocas += 1

        return  qtd_comparacoes, qtd_trocas

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