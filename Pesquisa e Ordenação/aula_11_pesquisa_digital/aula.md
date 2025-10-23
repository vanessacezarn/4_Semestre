# HASH ou TABELA HASH
## ANOTAÇÕES ZAMBERLAN
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

## ANOTAÇÕES GERAIS
- HASH
  - melhor estrutura de dados para guardar e buscar
  - é uma função que transforma uma chave em um índice (endereço) em uma tabela (vetor) ➔ calcula em qual bucket o elemento será colocado
  - objetivo ➔ distribuir os elementos pelos índices para acelerar buscas, inserções e remoções
- chave-hash ➔ presente em sistemas de segurança devido a sua codificação
    - é o resultado da cálculo do hash da chave original
- a mesma entrada sempre gera o mesmo hash ➔ é deterministica
    -  ao adicionar o numero ele gera um endereco, toda vez que adiciono o mesmo numero vai para o mesmo endereco. sempre mesmo output para o input
- problemas de COLISÕES ➔ chave hash duplicada ➔ quando duas chaves produzem o mesmo indice
    - pode ser resolvido com listas naquele índice 
    - método de resolução de colisões em tabelas hash ➔ **open addressing** ➔ se tem colisão vai indo pro lado até achar um espaço desocupado, há tipos de formas de ir para o lado até inserir novo valor
- TABELA HASH
  - normalmente é um vetor de buckets, em que cada um pode ser uma lista para tratar as colisões
  - buckets ➔ posição da tabela hash que pode armazenar um ou mais elementos
    - é como uma gaveta para onde vão todos os elementos que produzem o mesmo endereço hash 
