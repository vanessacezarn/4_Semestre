# Árvore B (B-tree)
cada nó seria uma lista, mas uma lista rasa
- Aplicação
    - pesquisa em memória secundária
    - árvore equilibrada e não profunda
    - agilidade no acesso a dados ou chaves
    - coleção de páginas
- Ordem de uma árvore B
    - tem relação com ao números de descendentes de um nó e a quantidade de ponteiros para no dos filhos
    - uma árvore de ordem m, o número máximo de chaves é m-1
- Processo de divisão (split)
    - página dividida na inserção
    - os nós são divididos igualmente entre as páginas
    - número mínimo de chaves em um nó é: (m / 2) – 1. exceto para a raiz
- Inserção
    - Sempre ocorre em nós folhas
    - Sempre haverá divisão/split quando página exceder número máximo de chaves/dados
    - passos básicos:
        1) Inserir de forma ordenada o novo dado/chave em um nó folha
        2) Nó (página) cheio, realize a divisão (split), movendo o dado/chave do meio para nó raiz
        3) Caso o nó raiz também exceda, repita o procedimento de divisão também no raiz
- Exercicio: Insira os seguintes números em uma árvore B de ordem 5:
    - 3, 7, 9, 23, 45, 1, 5, 14, 25, 24, 13, 11, 8, 19, 4, 31, 35, 56
<p align="center">
  <img width="576" height="179" alt="{50D323CE-49D8-4D54-81A4-4B2DA5B35D07}" src="https://github.com/user-attachments/assets/560e906a-b842-45b6-b25e-138882acccc7" />
</p>
