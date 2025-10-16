# HASH ou TABELA HASH

- Técnica de 'espalhamento' ou posicionamento, via endereço, por cálculo a partir de uma chave de entrada.
- Técnica do Sistema Operacional (SO) para gerenciamento de arquivos em memória secundária,
  ou seja, quando um arquivo é criado, o SO aplica a função hash sobre um dos campos do arquivo (chave),
  em geral identificador, e define uma posição na memória secundária.

### Vantagens da técnica:
- acesso direto, ou seja, pesquisa/busca otimizada
    
### Problema pode ocorrer?
COLISÃO, ou seja, chaves iguais que levam ao mesmo endereção
    
### Subtécnicas de tratamento de colisão
- via uso de vetor (alocação estática)
    - Open addressing (endereçamento aberto) com TABELA HASH FECHADA (tem limite do vetor)


- via uso de lista encadeada (alocação dinâmica)
    - Linked list com TABELA HASH ABERTA (com limite só da memória)


- IDEAIS para estruturas de dados MUIIIIITO GRANDES, para facilitar o espalhamento, ou seja,
diminuir as colisões

