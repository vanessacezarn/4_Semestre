# O que foi visto até aqui 
## Aula semana 1
    - Discussão e entendimento do plano de ensino
        - ordenação: conceitos: algoritmos
        - pesquisa : conceitos; algoritmos
        - pesquisa digital: algoritmos
        - tabelas hash: conceitos, algoritmos
        - balanceamento em árvores: conceitos, algoritmos
        - árvore B: conceitos, algorimos
    - Revisão
        - Orientação a objetos: estruturação de código: popular, exibir,..., ➔ Orientada a Objetos com métodos de classe(classic)
        - estrutura de dados: listas nas 3 linguagens(python, java e c#)

## Aula semana 2 
    - Desafio: a partir dos códigos gerados em java, c# e python, adicionar os métodos de popular lista a partir de arquivos, tanto para listas com números inteiros, quanto para lista de palavras

## Aula semana 3 14/08 - hoje 
    - Conceitos e fundamentos associados à ordenação
    - entender e implementar 3 métodos de ordenação: seleção, bolha e inserção
# ORDENAÇÃO
## Conceitos e fundamentos
    - O que é ordenar: organizar uma estrutura de dados (cresc ou descresc) usando uma ou mais chaves de controle (variável)
    - Por que ordenar? porque estruturas ordenadas tem a busca ou pesquisa mais eficiente, devido aos algoritmos baseados em árvores
    - Categorias de ordenação para os algoritmos:
        - Memória interna ou memória externa

        - Estabilidade do algoritmo:
            - estável: o processo de ordenação SEMPRE garante a ordenação temporária da estrutura
                * vai 'jogando' o maior para o final: 
                    [4,8,1,3,4,2]  
                    [4,1,3,4,2,8] 
                    [1,3,4,2,4,8] 
                    [1,3,2,4,4,8] 
                    [1,2,3,4,4,8]      
            - instável: o processo de ordenação não garante a ordenação temporária da estrutura
                * ao trocar o 1 pelo 4 na primeira ordenação, gera uma instabilidade pois o 8 não é menor que 4, a segunda troca também gera uma instabilidade pois o 3 não é maior que o 4
                    [4,8,1,3,4,2] 
                    [1,8,4,3,4,2] 
                    [1,2,4,3,4,8] 
                    [1,2,3,4,4,8] 
                    [1,2,3,4,4,8]      
                - adequado para listas feitas em C ou C++ com alocação de dinâmica de memória, como trabalhado na disciplina de Estrutura de Dados
            - Observação: ao ordenar os algoritmos garantem porções ordenadas na estrutura:
                - final: como ocorreu na estável
                - frente: como ocorreu no instável
                - nas extremidades ( pirâmede invertida)
        
        - Complexidade: quantidade de esforço computacional (tarefa, rotina, método) envolvido no algoritmo
            - Na ordenação a complexidade dos algoritmos é medida pela quantidade:
                - comparação
                - trocas
            - Categorias de complexidade:
                - Complexidade Fatorial     ➔ O(n!)     ➔ menos eficiente
                - Complexidade ??           ➔ O(n^k)
                - Complexidade Exponencial  ➔ O(n^2)
                - Complexidade Linear       ➔ O(n)
                - Complexidade Logaritmica  ➔ O(log n)  ➔ mais eficaz
#### Atividade de fixação
- Pesquisar na literatura, internet ou IA Generativa sobre os métodos de ordenação e categoriza-los em :
    - algoritmo de memória interna ou memória externa 
    - estabilidade (estável ou instável)
    - complexidade
    - porções de ordenação
- Pesquisar o seguintes métodos de ordenação:
    - bolha (bubllesort):
        - Memória: interna
        - Estabilidade: estável
        - Complexidade : 0(n^2)
        - porção ordenada: final

    - seleção (selection sort)
        - Memória: interna
        - Estabilidade: instável
        - Complexidade : O(n^2)
        - porção ordenada: inicial

    - inserção (inserction sort)
        - Memória: interna
        - Estabilidade: estável
        - Complexidade : O(n^2)
        - porção ordenada: inicial

    - pente (comb sort)
        - Memória: interna
        - Estabilidade: instável
        - Complexidade : O(n^2)
        - porção ordenada: final

    - agitação (shakesort ou cocktailsort)
        - Memória: interna
        - Estabilidade: estável
        - Complexidade : O(n^2)
        - porção ordenada: final e inicial --> ordena nos dois sentidos

    - shellsort 
        - Memória: interna
        - Estabilidade: instável
        - Complexidade : O(n log² n)
        - porção ordenada: nenhuma parte fixa, refina até ordenar tudo

    - heapsort
        - Memória: interna
        - Estabilidade: instável
        - Complexidade : O(n log n)
        - porção ordenada: final

    - mergesort
        - Memória: externa
        - Estabilidade: estável
        - Complexidade : O(n log n)
        - porção ordenada: vetor é dividido e depois unido já ordenado

    - quicksort
        - Memória: interna
        - Estabilidade: instável
        - Complexidade : O(n^2)
        - porção ordenada: indefinida, depende das partições

    - bucketsort
        - Memória: externa
        - Estabilidade: estável
        - Complexidade : O(n+k)
        - porção ordenada: por grupos

    - radix
        - Memória: externa
        - Estabilidade: estável
        - Complexidade : O(n*k)
        - porção ordenada: 