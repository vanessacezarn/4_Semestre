"""
 filho_Esquerda = raiz * 2 + 1
 filho_Direita = raiz * 2 + 2
 heapmaximo --> para cada raiz(pai) analisada é maior ou igual a seus filhos 
"""
class Ordenacao:
    @staticmethod
    def em_heap_maximo(lista):
        i = 0
        while(i*2+1 < len(lista)):
            fe = i * 2 + 1
            fd = i * 2 + 2
            if (lista[i] < lista[fe]):
                return False
            if (fd < len(lista)):
                if (lista[i] < lista [fd]):
                    return False
                
            i+=1
        return True
    
    @staticmethod
    def heap_minimo(lista):
        i = 0
        while(i*2+1 < len(lista)):
            fe = i * 2 + 1
            fd = i * 2 + 2
            if (lista[i] > lista[fe]):
                return False
            if (fd < len(lista)):
                if (lista[i] > lista [fd]):
                    return False
                
            i+=1
        return True
    
   
def main():
    lista= [10, 5, 6, 2, 3] #heapMaximo
    lista1 = [1, 3, 6, 8, 7] #heapMinimo

    if (Ordenacao.em_heap_maximo(lista1)):
        print("Em heap máximo")
    else:
        print('Não está em heap máximo')

    if (Ordenacao.heap_minimo(lista1)):
        print("Em heap minimo")
    else:
        print('Não está em heap minimo')



if __name__ == "__main__":
    main()

