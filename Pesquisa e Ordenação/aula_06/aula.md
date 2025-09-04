# REVISÃO 
- métodos já estudados: bolha, seleção, insersão, agitação, pente, shell
### O que é ordenação e por que é importante ordenar estruturas de dados?
- Ordenar é organizar uma estrutura de dados, seja em ordem crescente ou decrescente, usando uma ou mais chaves de controle, variáveis. Ordenar a estrutura de dados é de suma importância pois torna a busca e/ou pesquisa por dados mais eficientes, devido aos algoritmos baseados em árvores.
  
### Dos vários algoritmos de ordenação, há categorias que os classifica, como: estabilidade | complexidade
#### Explique o que é estabilidade e complexidade. Se necessário, dar exemplos. Quais os métodos estudados que são estáveis e quais que são instáveis
  - Estabilidade do algoritmo refere-se a ..., quanto a estabilidade ela pode ser classificada em estável e instável. Estável é quando o processo de ordenação **sempre** garante a ordenação temporária da estrutura, em geral o maior elemento vai sendo "jogado" para o final até a lista ser ordenada, já instável, o processo de ordenação não garante a ordenação tempóraria da estrutura, sendo adequada para lista feitas em c e c++ com alocação dinâmica de memória.
  - Complexidade é a quantidade de esforço computacional, como tarefa, rotina método, envolvido no algoritmo de ordenação, ela é medida pela quantidade de comparações e trocas realizadas durante a ordenação. A complexidade pode ser subdividida em categorias, algumas delas são, da menos eficiente para a mais eficiente, complexidade fatorial (O(n!)), complexidade polinomial (O(n^k)), complexidade exponencial (O(n^2)), complexidade linear (O(n)) e complexidade logaritmica (O(log(n)).
  - Dos métodos já estudados que são estáveis o bolha, inserção e agitação, já os que são instáveis são o seleção, o pente e o shell.

### Dos métodos estudados, quais suas complexidades? Como é avaliada a complexidade de um método de ordeanação?
- A complexidade de um método de ordenação é medida pela quantidade de comparações e trocas realizadas na ordenação. Dos métodos já estudados, os que possuem complexidade exponencial (O(n^2)) são o bolha, seleção, inserção agitação, pente e shell.
  
### Dos métodos estudados, qual o melhor método de ordenação?
- O melhor método de ordenação depende de como está a lista. Para escolher o métodos mais adequado é preciso levar em considerar o tamanho da estrutura e o quanto dela já está ordenado.
  
### Faça um método na sua linguagem de preferência que retorne true/True se a lista enviada como parâmetro está ordenada, o false/False caso contrário.

### Da a sequência de valores na estrutura abaixo, contabilize quantas comparações e quantas trocas há para os métodos: bolha | pente | seleção
```
 0   1   2   3   4   5   6   7   8
30  90  10  20  80  10  20  40  10
```
- para o método bolha foram feitas 56 comparações e 20 trocas, para o método pente foram feitas 3 comparações e 2 trocas e para o método seleção foram feitas 36 comparações e 6 trocas.
  
### Na sua linguagem de preferência, implemente (sem consulta) seu método escolhido para saber.
#### bolha
```py
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
```
#### pente
```py
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
#### seleção
```py
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
```
