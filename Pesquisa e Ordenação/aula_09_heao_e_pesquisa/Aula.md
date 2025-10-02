##  Fazer uma função que retorne True se a lista está em heap máximo
#### HeapMaximo e HeapMinimo em PYTHON

```.py
"""
 filho_Esquerda = raiz * 2 + 1
 filho_Direita = raiz * 2 + 2
 heapmaximo --> para cada raiz(pai) analisada é maior ou igual a seus filhos
 heapminimo --> valor de cada nó pai(raiz) é menor ou igual ao valor de seus filhos
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

```
#### HeapMaximo Java
```.java
import java.util.ArrayList;
import java.util.List;
 
class Ordenacao {
    public static boolean emHeapMaximo(ArrayList<Integer> lista) {
        int fe, fd;
        for (int i = 0; i*2+1 < lista.size(); i++) {
            fe = i * 2 + 1;
            fd = i * 2 + 2;
            if (lista.get(i) < lista.get(fe)) {
                return false;
            }
            
            if (fd < lista.size()){
                if (lista.get(i) < lista.get(fd)){
                    return false;
                }
            }
        }        
        return true;
    }
}
 
public class Heap {
    public static void main(String[] args) {
        ArrayList<Integer> lista = new ArrayList<>(List.of(8, 3, 6, 1));
 
        System.out.println("Lista original: " + lista);
 
        if (Ordenacao.emHeapMaximo(lista)){
            System.out.println("Em heap máximo");
        }
        else {
            System.out.println("Não em heap máximo");
        }    
    }
}
 
```

## exercicio
- fazer um programa que:
    - armazene milhoes de números inteiros pouco repetidos (desordenado)
    - localize o menor número gerado
    - retorne o número
    - temporize esse processamento
    - contabilize o número de comparações

```py
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


```
# PESQUISA
A ordenação influencia no desempenho da pesquisa/busca
## Pesquisa sequencial e pesquisa binária

### Pesquisa em estruturas vetores/listas:
- sequencial (usada quando a estrutura não está ordenada)
- O(n)
```.c
  long long int sequencial(int numero, int *vetor, long long int n) {
      long long int i;
      for (i = 0; i < n; i++) {
          if (numero == vetor[i]) {
              return i;
          }
      }
      return -1; //valor não encontrado
  }
```
### binária 
- (dependente da ordenação e baseada na dinâmica de árvores binárias)
- O(log n)
- não é nativa --> tem que construir ela
- o melhor método para achar seria o arvore --> se  não quiser usar o arvore --> implementa esse
```.c
  long long int binaria(int numero, int *vetor, long long int n) {
      long long int ini = 0, fim = n - 1, meio;

      while (ini <= fim) {
          meio = (ini + fim)/2;
          if (numero == vetor[meio]) {
              return meio;
          }
          if (numero < vetor[meio]) {
              fim = meio - 1;
          } else {
              ini = meio + 1;
          }
      }
      return -1; //valor não encontrado
  }
```
#### em java
```.java
import java.util.ArrayList;
import java.util.List;

class Util{
    public static int pesquisaBinaria(int numero,ArrayList<Integer>lista){
        int ini = 0;
        int fim = lista.size();
        int meio;
        while (ini <= fim){
            meio = (int)(ini+fim)/2;
            if (numero == lista.get(meio)){
                return meio; //localizado
            }
            if(numero < lista.get(meio)){
                fim = meio -1;
            }else{
                ini = meio + 1;
            }
        }

        return -1;
    }
}

public class Pesquisa {
   public static void main(String[] args) {
    ArrayList<Integer> lista = new ArrayList<Integer>(List.of(9,7,3,2,9,1,1,6,7,4,14));

    System.out.println("Lista original: "+lista);
    System.out.println(lista.indexOf(14));

    lista.sort(null);

    System.out.println("lista ordenada"+lista);
    System.out.println(Util.pesquisaBinaria(14, lista));
   } 
}

```
