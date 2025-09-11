- PRINCÍPIO DIVIDIR PARA CONQUISTAR
    - Características clássicas/comuns:
      - Recursão: chamada do próprio método. Vantagem: simplicidade no código | Desvantagem: consumo excessivo de memória RAM
         - a cada processo de recursão, tanto quick quanto merge dividem o vetor/ estrutura como se fossem folhas de uma árvore
      - ambos os métodos, na recursão, mais precisamente no empilhamento, eles dividem as estruturas. Porém, na volta do empilhamento, no retorno da recursão que ocorre  
    - Quicksort
      - C# implementa seu sort com ele
      - usa uma variável chamada PIVO  para repartir/dividir (recursivo), em que os menores devem estar a sua esquerda, enquanto os maiores a sua direita
      - tem ini(lado esquerdo), fim(lado direito) e pivo (posição)
    - Mergesort
      - Java implementa seu sort com ele
      - usa 3 variáveis: ini (marca o lado esquerdo da estrutura), fim (maraca o lado direito) e meio

- Heapsort
  - baseado na filosofia de árvore

 
## QUICKSORT (USA O CONCEITO DE DIVIDIR PARA CONQUISTAR)
- Faz parte de uma categoria de métodos de ordenação que utilizam a divisão da estrutura para acelerar a ordenação. Essa ivisão é realizada por meio de RECURSÃO.
    - A estrutura possui 2 porções: parte esquerda e parte direita, divididas pelo PIVO. Pensar como se fosse uma ÁRVORE BINÁRIA desbalanceada
    - O método possui duas funções: quick (processo recursivo) e o particiona (posiciona/ordena o pivo)
      
```
0   1   2   3   4   5   6   7   8
30  90  10  20  80  10  20  40  10    ini = 0 fim = 8 pivo =  0/30 -> for da direita p/ esquerda| 30 é maior que 10
10  90  10  20  80  10  20  40  30    ini = 1 fim = 8 pivo =  8/30 -> for esquerda p/ direita| 30 é menor q 90
10  30  10  20  80  10  20  40  90    ini = 1 fim = 7 pivo =  1/30 -> for da direita p/ esquerda |30 é maior q 20
10  20  10  20  80  10  30  40  90    ini = 4 fim = 6 pivo = 6/30  -> for esquerda p/ direita |30 é menor que 80
10  20  10  20  30  10  80  40  90    ini = 4 fim = 5 pivo = 4/30  - >
10  20  10  20  30  10  80  40  90    ini = 4 fim = 5 pivo = 4/30
10  20  10  20  10  30  80  40  90    ini = 5 fim = 5 pivo = 5/30
                    30                ta ordenado, tem algo pra esquerda? vai pra la, se não vai pra direita
10  20  10  20  10                    ini = 0 fim = 4 pivo = 0/10
10                                      ta ordenado, tem algo para esquerda? não tem nada | tem algo pra direita?
    20  10  20  10                    ini = 1 fim = 4 pivo = 1/20
    10  10  20  20                    ini = 2 fim = 4 pivo = 4/20
                20                    ta ordenado, tem algo para esquerda?
    10  10  20                        ini = 1 fim = 3 pivo 1/10
                                      tudo ordenado a esquerda do 30 --> vai para a direita do 30
                        80  40  90    ini = 6 fim = 8 pivo 6/80
                        40  80  90    ini = 7 fim = 7 pivo 7/80
10  10  10  20  20  30  40  80  90

pivo escolhido no inicio vai se manter igual o tempo inteiro
encerra quando o ini e fim forem igual --> troca o pivo
for da esquerda para direita
  i = fim, i--
for da direita para esquerda
  i = ini, i++
todos a esquerda tem que serem menores e todos a direita tem que serem maiores, por isso fica mudando a direção do for
```
### CODIGO EM C
```c
int particiona(int *vetor,  int ini,  int fim) {
    int pivo;
    int tmp; // para as trocas
    int qtdComparacoes;
    int qtdTrocas;

    pivo = ini; //na bibliografia do método, é possível ser o ini, o fim ou uma posição sorteada
    while (fim > ini) {

        // analise da direita para esquerda
        for (; fim > pivo && vetor[fim] > vetor[pivo]; fim--, qtdComparacoes++); //garantindo que os maiores fiquem na direita

        if (fim > pivo) {
            qtdTrocas++;
            tmp = vetor[pivo];
            vetor[pivo] = vetor[fim];
            vetor[fim] = tmp;
            pivo = fim;
        }

        // analise da esquerda para direita
        for (ini++; ini < pivo && vetor[ini] < vetor[pivo]; ini++, qtdComparacoes++);

        if (ini < pivo) {
            qtdTrocas++;
            tmp = vetor[pivo];
            vetor[pivo] = vetor[ini];
            vetor[ini] = tmp;
            pivo = ini;
        }
    }
    return pivo;
}

void quickSort(int *vetor, int ini,  int fim) { //método recurisivo baseado em árvore desbalanceada
     int pivo;

    pivo = particiona(vetor, ini, fim); //no final do particiona, o pivo está ordenado e é ordenado a posicao do pivo
    
    if (ini < pivo - 1) // tem lado esqurdo com mais de 1 elemento
        quickSort(vetor, ini, pivo - 1); //se existe lado esq do pivo, executa lado esq
    if (pivo + 1 < fim) // tem lado direito com mais de 1 elemento
          quickSort(vetor, pivo + 1, fim); //se existe lado dir do pivo, executa lado dir
}
```


## MERGESORT (como o quicksort, USA O CONCEITO DE DIVIDIR PARA CONQUISTAR)
- Faz parte de uma categoria de métodos de ordenação que utilizam a divisão da estrutura para acelerar a ordenação. Essa divisão é realizada por meio de RECURSÃO.

- Contudo, diferente do QUICKSORT, o MERGESORT sempre divide a estrutura no meio (vai existir uma variável meio)
    - A estrutura vai possuir 2 porções: parte esquerda e parte direita, divididas pelo MEIO. Pensar como se fosse uma ÁRVORE BINÁRIA
    - O método possui duas funções: merge (processo recursivo) e o intercala (a ordenação vai funcionar no desempilhamento do processo em que intercala e ordena)
    


## HEAPSORT (método baseado na dinâmica de árvores binárias, contudo em lista)
- Heapmáximo: garantir que raiz da subarvore seja maior ou igual que seus filhos. Se isso não ocorrer, fazer as trocas
  - filhoEsquerda = posicaoRaiz * 2
  - filhoDireita = posicaoRaiz * 2 + 1
- Troca do primeiro com o último e diminui uma posição o lista (fim)

- ATENÇÃO: o lista deve começar na posição 1

- Teste para filho esquerda 
  -    -> if (lista[raiz] < lista[raiz * 2]) { troca }
- Teste para o filho da direita (antes de testar, é preciso ter certeza que o filho exista)
  -   -> if (raiz * 2 + 1 < n && lista[raiz] < lista[raiz * 2 + 1]) { troca }
