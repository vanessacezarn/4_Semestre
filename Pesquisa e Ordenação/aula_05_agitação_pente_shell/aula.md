## REVISÃO ORDENAÇÃO
- implementação simples, porém alta complexidade O(n^2): quantidade de comparações e quantidade de trocas
    - bolha: estável, parte ordenada no final
    - seleção: instável, parte ordenada no inicio
    - inserção: estável, parte ordenada no inicio
## AULA DE HOJE
- incrementos ou melhorisas dos métodos bolha e inserção
    - técnica de análise de dois elementos distantes n posições: pré-organiza e diminui o número de trocas
        - variáveis distância - h
    - do bolha há o pente - combsort
    - do inserção há o shellsort
    - do bolha há o shakesort ou cocktailsort ou agitação (sem uso de distância)
        - ordena da esquerda para direita e da direita para esquerda

## PROVA 11/09
- SOMENTE PARTE TEÓRICA
- TEM QUE SABER FAZER/ESCREVER UM DOS MÉTODOS DE ORDENAÇÃO ATÉ O FIM DE SEMESTRE
    - prova vai ser escrever um deles
- vetor que ordene por bolha,..., passo a passo que nem os exemplo
- papel da complexidade, pesquisa,...
- melhor método para ordenação: arvore
- qual melhor método de ordenação? depende da organização da lista, do tamanho

  # AGITAÇÃO - Shake Sort ou Cocktail
- É baseado no Bolha, ou seja, é uma tentantiva de melhorar o Bolha.
- Estável
- Memória Interna
- A estrutura possui 3 partes/porções (1a é a ordenada pelos menores; 2a é a desordenada; 3a é a ordenada pelos maiores)
- De fato é a aplicação do bolha da esquerda para direita e depois da direita para esquerda
- Há os índices/ponteiros ini e fim que marcam o início e o final da estrutura

- Observação:
    - i) se a estrutura estiver ordenada ou quase, o agitação terá excelente desempenho, como o bolha
    - ii) atenção a lista deve ser duplamente encadeada
```
ini = 0
fim = 6 depois da primeira ordenação fim = 5

0   1   2   3   4   5   6  QUANTIDADE DE ELEMENTOS
7   1   4   2   3   9   8  VETOR A SER ORDENADO
1   4   2   3   7   8   9  DA ESQUERDA PARA DIREITA
1   2   4   3   7   8   9  DA DIREITA PARA ESQUERDA
1   2   3   4   7   8   9
1   2   3   4   7   8   9

```
### CODIGO EM C#
```.cs
void agitacao(List<> lista) {
    bool houveTroca;
    int tmp;
    int ini = 0
    int fim = lista.Count;
    int qtdComparacoes = 0, qtdTrocas = 0;

    do {
        houveTroca = False;
        for (int i = 0; i < fim; i++){
            qtdComparacoes++;
            if (lista[i] > lista[i+1]) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista[i];
                lista[i] = lista[i+1];
                lista[i+1] = tmp;
            }
        }
        if(!houveTroca){
          break;
        }
        fim--;

        houveTroca = False;
        for (int i = fim; i > ini+1; i--){
            qtdComparacoes++;
            if (lista[i] < lista[i-1]) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista[i];
                lista[i] = lista[i-1];
                lista[i-1] = tmp;
            }
        }
        ini++;    
    } while (houveTroca);
}
```
### CODIGO EM JAVA

```.java
void agitacao(List<> lista) {
    boolean houveTroca;
    int tmp;
    int ini = 0
    int fim = lista.size();
    int qtdComparacoes = 0, qtdTrocas = 0;

    do {
        houveTroca = false;
        for (int i = 0; i < fim; i++){
            qtdComparacoes++;
            if (lista.get(i) > lista.get(i+1) {
                qtdTrocas++;
                houveTroca = true;
                tmp = lista.get(i);
                lista.set(i) = lista.get(i+1);
                lista.set(i+1) = tmp;
            }
        }
        if(!houveTroca){
          break;
        }
        fim--;

        houveTroca = False;
        for (int i = fim; i > ini+1; i--){
            qtdComparacoes++;
            if (lista.get(i) < lista.get(i-1)) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista.get(i);
                lista.set(i) = lista.get(i-1);
                lista.set(i-1) = tmp;
            }
        }
        ini++;    
    } while (houveTroca);
}
```
### CODIGO EM PYTHON

```py
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
```
# PENTE - Comb Sort
- É baseado no Bolha, ou seja, é uma tentantiva de melhorar o Bolha.
- ATENÇÃO: a partir deste método, há COMPARAÇÕES a uma distância X. Isso gera uma pré-organização da estrutura, diminuindo número de comparações e trocas.
- Instável
- Memória Interna
- A estrutura possui 2 porções/partes (1a é a ordenada; 2a é a desordenada)

- Há as variáveis clássicas do bolha: i, houveTroca, tmp.
- Há a variável distancia que é calculada pelo tamanho da estrutura dividido por 1.3

- Adequado somente para listas ou estruturas prontas tipo lista de uma linguagem de programação
  
```
n = 7
0   1   2   3   4   5   6   
7   1   4   2   3   9   8    distancia = (int)n / 1.3 = 5 * o i tem que parar antes da distancia estourar -> 7 é maior que 9. 1 é maior que 8, 4 estorou o tamanho, mantem os dados naquela posição
7   1   4   2   3   9   8    distancia = distancia / 1.3 = 3
2   1   4   7   3   9   8    distancia = distancia / 1.3 = 2
2   1   3   7   4   9   8    distancia = distancia / 1.3 = 1 -> vira bolhaoca p 
1   2   3   4   7   8   9    distancia = 1 resultado não pode ser menor que 1 
1   2   3   4   7   8   9    -> se não tem troca pode parar
```

### CODIGO EM C#
```.cs
void pente(List<> lista) {
    bool houveTroca;
    int tmp;
    int distancia = lista.Count();
    int qtdComparacoes = 0, qtdTrocas = 0;

    do {
        distancia = (int) distancia/1.3;
        if (distancia <1){
            distancia = 1;
        }
        houveTroca = false;
        for (int i = 0; i+distancia < lista.Count(); i++){
            qtdComparacoes++;
            if (lista[i] > lista[i+distancia]) {
                qtdTrocas++;
                houveTroca = True;
                tmp = lista[i];
                lista[i] = lista[i+distancia];
                lista[i+distancia] = tmp;
            }
        }
    } while (houveTroca || distancia > 1);
}
```
### CODIGO EM JAVA

```.java

```
### CODIGO EM PYTHON

```py
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

```

# SHELLSORT 
- É baseado no Inserção, ou seja, é uma tentativa de melhoria via o uso da ANÁLISE A DISTÂNCIA (tipo pente)
- Instável 
- Memória Interna
- Não é adequado para listas encadeadas
- quando a distância = 1 vira inserção

```c#
void shell(Lista<> lista) {
    int i, j;
    int tmp;
    int qtdComparacoes = 0, qtdTrocas = 0;
    int distancia = 1

    int referenciaTamanho = 3;

    do{  
        distancia = referenciaTamanho * distancia + 1;
    while(distancia < n):

    do{
      distancia = (int)distancia/referenciaTamanho  
      for (i = distancia; i < n; i++) {
          tmp = lista[i];
          for (j = i - distancia; j >= 0; j = j - distancia) {
              qtdComparacoes++;
              if (tmp < lista[j]) {
                  lista[j + 1] = lista[j]; //shift eh trocar para o lado
                  qtdTrocas++;
              } else break;
          }
          lista[j + 1] = tmp;
          qtdTrocas++;
      }
   }
}
```
