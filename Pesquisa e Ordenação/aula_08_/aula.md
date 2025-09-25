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
1*  8   4   15  12   7  3    raiz = p1 (8) filhoEsquerda = p2 (4) --> 8 é maior que 4, então troca
                             raiz = p1 (4)  filhoDireita = p3 (15) --> 4 é maior que 15, não, então mantem

```
### CODIGO EM PYTON
```
```
