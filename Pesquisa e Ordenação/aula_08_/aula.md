## Correção da prova
### QUESTÃO 5 
Imagine uma classe Pessoa contendo os atributos nome e idade. Agora, imagine uma lista (desordenada) de objetos em que é necessario organizar por nome (primeira chave) e por idade (segunda chave). Escolha seu algoritmo de sua preferência e implemente a solução na sua linguagem. Crie um método que receba a lista e a ordene nesses quesitos.
```.py
class Pessoa:
    def __init__(self,nome,idade):
          self.nome = nome
          self.idade = idade

    def __repr__(self):
         return f'Nome: {self.nome}. Idade: {self.idade}'

class Ordenacao:
    @staticmethod
    def bolha(lista):
            houve_troca = True
            fim = len(lista)
            while (houve_troca):    
                houve_troca = False
                for i in range (fim- 1):
                    if (lista[i].nome> lista[i+1].nome):
                        houve_troca = True
                        tmp = lista[i]
                        lista[i] = lista[i+1]
                        lista[i+1] = tmp
                    if (lista[i].nome == lista[i+1].nome):
                        if(lista[i].idade > lista[i+1].idade):
                            houve_troca = True
                            tmp = lista[i]
                            lista[i] = lista[i+1]
                            lista[i+1] = tmp     
                fim-=1
            return lista
def main():       
    lista = [Pessoa('Alex',25), Pessoa('Brian',30), Pessoa('Charlie',20), Pessoa('Alex',15), Pessoa('Brian',25)]

    Ordenacao.bolha(lista)
    for pessoa in lista:
         print (pessoa)
if __name__ == '__main__':
     main()
```
 

## HEAPSORT 
### método baseado na dinâmica de árvores binárias, contudo em lista
- Heapmáximo: garantir que raiz da subarvore seja maior ou igual que seus filhos. Se isso não ocorrer, fazer as trocas:
    - filhoEsquerda = posicaoRaiz * 2
    - filhoDireita = posicaoRaiz * 2 + 1
    - Troca do primeiro com o último e diminui uma posição o lista (fim)
  
- ATENÇÃO: o lista deve começar na posição 1
- Teste para filho esquerda 
   - if (lista[raiz] < lista[raiz * 2]) { troca }
- Teste para o filho da direita (antes de testar, é preciso ter certeza que o filho exista)
   - if (raiz * 2 + 1 < n && lista[raiz] < lista[raiz * 2 + 1]) { troca }
- Anotações:
    - Heapmáximo:
      - garantir que o raiz seja o menor possivel --> pai não pode ser maior que os filhos
      - enquanto estiver tendo troca de posições tem que repetir o processo --> recursão
    - Estabilidade: instável
    - Complexidade:
    - para começar no inidice 0 --> filhoESQ = posicaRaiz*2 + 1
                                --> filhoDIRE = posicaoRaiz*2 + 2 
```
1   2   3   4   5   6   7
15  7   4   8  12   1   3    raiz = p1 (15) filhoEsquerda = p2 (7) --> 15 é maior que 7, então troca
                             raiz = p1 (7)  filhoDireita = p3 (4) --> 7 é maior que 4, então troca
4  15   7   8  12   1   3    raiz = p2 (15) filhoEsquerda = p4 (8) --> 15 é mairo que 8, então troca
                             raiz = p2 (8)  filhoDireita = p5(12) --> 8 é maior que 12, não, então mantem
4   8   7   15  12   1  3    raiz = p3 (7)  filhoEsquerda = p6 (1) --> 7 é maior que 1, então troca
                             raiz = p3 (1)  filhoDireita = p7(3) -->  1 é maior que 3, não, então mantem
4   8   1   15  12   7  3    raiz = p1(4) filhoEsquerda = p2(8) --> 4 é maior que 8, não, então mantem
                             raiz = p1(4) filhoDireita = p3(1) --> 4 é maior que 1, então troca
1   8   4   15  12   7  3    raiz = p2(8) filhoEsquerda = p4(15) --> 8 é maior que 15, não então mantem
                             raiz = p2(8) filhoDireita =p5(12) --> 8 é maior não, então mantem
                             NÃO TEVE TROCA --> 1 FICA FIXO NA POSIÇÃO
    1   2   3   4    5  6   INDICES DA POSIÇÃO
1*  8   4   15  12   7  3    raiz = p1 (8)  filhoEsquerda = p2 (4) --> 8 é maior que 4, então troca
                             raiz = p1 (4)  filhoDireita = p3 (15) --> 4 é maior que 15, não, então mantem
1*  4   8   15  12   7  3    raiz = p2 (8)  filhoEsquerda = p4 (12) --> 8 é maior que 12,não então mantem
                             raiz = p2 (8)  filhoDiretita = p5(7) --> 8 é maior que 7, então troca
1*  4   7   15  12   8  3    raiz = p3(15)  filhoEsquerda = p6 (3) --> 15 é maior que 3, então troca
                             raiz = p3 (3)  filhoDireita = p7 --> NÃO EXISTE
1*  4   7   3   12   8  15   raiz = p1 (4)  filhoEsquerda = p2(7) --> 4 é maior que 7, não, então mantem
                             raiz = p1 (4)  filhoDireita = p3 (3) --> 4 é maior que 3, então troca
1*  3   7   4   12   8  15   raiz = p2 (7)  filhoEsquerda = p4 (12) --> 7 é maior que 12,não, então mantem
                             raiz = p2 (7)  filhoDiretita = p5(8) --> 7 é maior que 8,não, então mantem
                             NÃO TEVE TROCA --> 3 FICA FIXO NA POSIÇÃO
        1   2   3   4   5   INDICES DA POSIÇÃO
1*  3*  7   4   12  8   15   raiz = p1(7) filhoEsquerda = p2 (4) --> 7 é maior que 4, então troca
                             raiz = p1 (4)  filhoDireita = p3 (12) --> 4 é maior que 12, não, então mantem
1*  3*  4   7   12  8   15   raiz = p2 (7)  filhoEsquerda = p4 (8) --> 7 é maior que 8, não então mantem
                             raiz = p2 (7)  filhoDiretita = p5(15) --> 7 é maior que 15, não, então mantem
                             NÃO TEVE TROCA --> 4 FICA FIXO NA POSIÇÃO
            1   2   3   4    INDICES DA POSIÇÃO
1*  3*  4*  7   12  8   15   raiz = p1 (7) filhoEsquerda = p2 (12) --> 7 é maior que 12, não, então mantem
                             raiz = p1 (7) filhoDireita = p3 (8) --> 7 é maior que 8, não, então mantem
                             NÃO TEVE TROCA --> 7 FICA FIXO NA POSIÇÃO
                1   2   3   INDICES DA POSIÇÃO
1*  3*  4*  7*  12  8  15    raiz = p1 (12) filhoEsquerda = p2 (8) --> 12 é maior que 8, então troca
                             raiz = p1 (8)  filhoDireita = p3 (15) --> 8 é maior que 15, não, então mantem
1*  3*  4*  7*  8  12  15    raiz = p2 (12) filhoEsquerda = p4 --> NÃO EXISTE
1*  3*  4*  7*  8  12  15    raiz = p1 (8) filhoEsquerda = p2 (23) --> 8 é maior que 12, não, então mantem
                             raiz = p1 (8)  filhoDireita = p3 (15) --> 8 é maior que 15, não, então mantem
                             NÃO TEVE TROCA --> 8 FICA FIXO NA POSIÇÃO
                    1   2   INDICES DA POSIÇÃO
1*  3*  4*  7*  8*  12  15   raiz = p1 (12) filhoEsquerda = p2 (15) --> 12 é maior que 15, não, então mantem
                             raiz = p2 (12) filhoEsquerda = p3 --> NÃO EXISTE


```
### CODIGO EM PYTON
```.py
import time

class Ordena:
    @staticmethod
    def heap(vetor, n):
        qtdComparacoes = 0
        qtdTrocas = 0

        while n > 1:
            i = n // 2
            while i > 0:
                qtdComparacoes += 1
                if vetor[i] < vetor[i * 2]:  # comparando raiz com filho da esquerda
                    tmp = vetor[i]
                    vetor[i] = vetor[i * 2]
                    vetor[i * 2] = tmp
                    qtdTrocas += 1

                if i * 2 + 1 <= n:  # só compara filho da direita se existir
                    qtdComparacoes += 1
                    if vetor[i] < vetor[i * 2 + 1]:
                        tmp = vetor[i]
                        vetor[i] = vetor[i * 2 + 1]
                        vetor[i * 2 + 1] = tmp
                        qtdTrocas += 1

                i -= 1

            tmp = vetor[1]
            vetor[1] = vetor[n]
            vetor[n] = tmp
            qtdTrocas += 1
            n -= 1

        return qtdComparacoes, qtdTrocas


def main():
    # Índice 0 não é usado, como no código em C
    lista_heap = [None, 15, 7, 4, 8, 12, 1, 3]
    n = len(lista_heap) - 1

    tempo_inicio = time.perf_counter()
    qtd_comparacoes, qtd_trocas = Ordena.heap(lista_heap, n)
    tempo_fim = time.perf_counter()

    tempo_heap = tempo_fim - tempo_inicio
    print(f'Tempo da rotina ordenar por heap: {tempo_heap:.6f} s')
    print(f'Comparações: {qtd_comparacoes} | Trocas: {qtd_trocas}')
    print("Vetor ordenado:", lista_heap[1:])


if __name__ == "__main__":
    main()

```
