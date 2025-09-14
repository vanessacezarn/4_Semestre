# MÉTODOS DE ORDENAÇÃO SIMPLES

## 1) BOLHA - Bubble Sort
- Estável
- Memória Interna
- Alta complexidade (muito esforço) - O(n^2)
- A estrutura possui 2 partes/porções (1a é a desordenada; 2a parte é a ordenada)
- Adequado para vetores e listas
  
```
0   1   2   3   4   5   6
7   1   4   2   3   9   8
1   4   2   3   7   8   9
1   2   3   4   7   8   9
1   2   3   4   7   8   9
```
- Trabalha com o conceito de trocas, ou seja, enquanto houver trocas, o algoritmo não para.
- É considerado bolha, porque 'leva' os maiores para o final da estrutura

- Observação: se a estrutura estiver ordenada ou quase, o bolha terá excelente desempenho
### codigo de bolha nas 3 linguagens
#### C#
```c#
void bolha(List<> lista) {
    bool houveTroca;
    int tmp;
    int qtdComparacoes = 0, qtdTrocas = 0;
    do {
        houveTroca = False;
        for (int i = 0; i < lista.Count()-1; i++){
            qtdComparacoes++;
            if (lista[i] > lista[i+1]) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista[i];
                lista[i] = lista[i+1];
                lista[i+1] = tmp;
            }
        }
    } while (houveTroca);
}

````
#### java

```java
void bolha(List<> lista) {
    boolean houveTroca;
    int tmp;
    int qtdComparacoes = 0, qtdTrocas = 0;
    do {
        houveTroca = False;
        for (int i = 0; i < lista.size()-1; i++){
            qtdComparacoes++;
            if (lista.get(i) > lista.get(i+1)) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista.get(i);
                lista.set(i, lista.get(i+1));
                lista.set(i+1, tmp);
            }
        }
    } while (houveTroca);
}

```
#### Python

```python
def bolha(lista) :
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

```
## 2) SELEÇÃO - Selection Sort
- Instável
- Memória Interna
- Alta complexidade (muito esforço) - O(n^2)
- A estrutura possui 2 partes/porções (1a é a ordenada; 2a parte é a desordenada)
- Adequado para vetores e listas

- Trabalha com conceito de trocas não contíguas. É considerado seleção porque ele seleciona os menores para o início da estrutura

- Observação: se a estrutura estiver ordenada, o método vai funcionar/processar como se a estrutura estivesse desordenada
  
```
      0   1   2   3   4   5   6 posMenor = 0 
      7   1   4   2   3   9   8
      1   7   4   2   3   9   8
      1   2   4   7   3   9   8
      1   2   3   7   4   9   8 bagunçou, pois o 4 é menor que 7 mas está depois dele
      1   2   3   4   7   9   8
      1   2   3   4   7   8   9
```
### codigo de seleção nas 3 linguagens

#### C#

```.c#
void selecao(List<>lista){
  int posMenor;
  int qtd_comparacoes = 0, qtd_troca=0;
  for(int i=o; i< lista.Count()-1; i++){
    posMenor = i;
    for(int j = i+1; j< lista.Count(); j++){
      qtd_comparacoes ++;
      if(lista[j]<lista[posMenor]){
        posMenor = j;
      }
    }
    if(i != posMenor){
      qtd_troca++;
      tmp = lista[i];
      lista[i] = lista[posMenor];
      lista[posMenor] = tmp;
    }  
  }
}
```
#### java
```.java
void selecao(List<>lista){
  int posMenor;
  int qtd_comparacoes = 0, qtd_troca=0;
  for(int i=o; i< lista.size()-1; i++){
    posMenor = i;
    for(int j = i+1; j< lista.size(); j++){
      qtd_comparacoes ++;
      if(lista.get(j)<lista.get(posMenor)){
        posMenor = j;
      }
    }
    if(i != posMenor){
      qtd_troca++;
      tmp = lista.get(i);
      lista.set(i, lista(posMenor));
      lista.set(posMenor,tmp);
    }  
  }
}
```

#### Python
```.py
def selecao(lista){
  qtd_comparacoes = 0
  qtd_troca=0
  for i in rnage(len(lista)-1):
    posMenor = i;
    for j in range (i+1,len(lista)
      qtd_comparacoes +=1
      if(lista[i]<lista[posMenor]):
        posMenor = j
      
    if(i != posMenor){
      qtd_troca +=1
      tmp = lista[i]
      lista[i] = lista[posMenor]
      lista[posMenor] = tmp

```

## 3) INSERÇÃO - Insertion Sort - O(n^2)
- Estável
- Memória Interna
- Alta complexidade - O(n^2)
- A estrutura possui 2 partes/porções (1a é a ordenada; 2a parte é a desordenada)
- Adequado para vetores e listas

 - Trabalha com o conceito de inserção na porção inicial, com isso, pode diminuir o número de comparações

 - Observação:
     - i) se a estrutura estiver ordenada ou quase, o inserção terá excelente desempenho
     - ii) atenção a lista deve ser duplamente encadeada



- Qual o melhor método de ordenação?
  - Depende: tamanho da estrutura; de como a estrutura já está previamente ordenada;

```c#
void insercao(int *vetor, long long int n) {
    long long int i, j;
    int tmp;
    long long int qtdComparacoes = 0, qtdTrocas = 0;
 
    for (i = 1; i < n; i++) {
        tmp = vetor[i];
        for (j = i - 1; j >= 0; j--) {
            qtdComparacoes++;
            if (tmp < vetor[j]) {
                vetor[j + 1] = vetor[j];
                qtdTrocas++;
            } else break;
        }
        vetor[j + 1] = tmp;
        qtdTrocas++;
    }
    cout << "Quantidade comparações: " << qtdComparacoes << endl;
    cout << "Quantidade trocas: " << qtdTrocas << endl  << endl;;
}
```


