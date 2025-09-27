class Pessoa:
    def __init__(self,nome,idade):
          self.nome = nome
          self.idade = idade

    def __repr__(self):
         return f'Nome: {self.nome}. Idade: {self.idade}'

class Ordenacao:
    @staticmethod
    def pente(lista):
        houve_troca = True
        dist = len(lista)
        while (houve_troca):
            dist = int(dist/1.3)
            if dist < 1:
                dist ==1
            houve_troca = False
            for i in range(0, len(lista)-dist):
                if lista[i].nome > lista[i+dist].nome:
                    houve_troca = True
                    tmp = lista[i]
                    lista[i] = lista [i+dist]
                    lista[i+dist] = tmp
                if lista[i].nome == lista[i+dist].nome:
                    if (lista[i].idade > lista[i+dist].idade):
                        houve_troca = True
                        tmp = lista[i]
                        lista[i] = lista [i+dist]
                        lista[i+dist] = tmp     
            if dist == 1 and not houve_troca:
                break
        return lista

def main():
    lista = [Pessoa('Alex',25), Pessoa('Brian',30), Pessoa('Charlie',20), Pessoa('Alex',15), Pessoa('Brian',25)]

    print(lista)
    Ordenacao.pente(lista)
    print(lista)
if __name__ == '__main__':
     main()