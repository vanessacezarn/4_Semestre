class Pessoa:
    def __init__(self, nome, idade):
        self.nome = nome
        self.idade = idade

    def __repr__(self):
        return f'Nome: {self.nome}. Idade: {self.idade}'


class Ordenacao:
    @staticmethod
    def agitacao(lista):
        houve_troca = True
        ini = 0
        fim = len(lista) - 1  # 'fim' é o índice final da lista (corrigido para len(lista) - 1)
        
        while houve_troca:
            houve_troca = False

            # Passagem da esquerda para a direita
            for i in range(ini, fim):
                if lista[i].nome > lista[i + 1].nome:
                    houve_troca = True
                    lista[i], lista[i + 1] = lista[i + 1], lista[i]  # Troca os elementos
                elif lista[i].nome == lista[i + 1].nome:
                    if lista[i].idade > lista[i + 1].idade:
                        houve_troca = True
                        lista[i], lista[i + 1] = lista[i + 1], lista[i]  # Troca os elementos

            fim -= 1  # Reduz o limite superior (último índice já está ordenado)

            # Passagem da direita para a esquerda
            for i in range(fim, ini, -1):
                if lista[i].nome < lista[i - 1].nome:
                    houve_troca = True
                    lista[i], lista[i - 1] = lista[i - 1], lista[i]  # Troca os elementos
                elif lista[i].nome == lista[i - 1].nome:
                    if lista[i].idade < lista[i - 1].idade:
                        houve_troca = True
                        lista[i], lista[i - 1] = lista[i - 1], lista[i]  # Troca os elementos

            ini += 1  # Aumenta o limite inferior (primeiro índice já está ordenado)

        return lista


def main():
    lista = [Pessoa('Alex', 25), Pessoa('Brian', 30), Pessoa('Charlie', 20),
             Pessoa('Alex', 15), Pessoa('Brian', 25)]

    print("Antes da ordenação:")
    print(lista)
    Ordenacao.agitacao(lista)
    print("Após a ordenação:")
    print(lista)


if __name__ == '__main__':
    main()
