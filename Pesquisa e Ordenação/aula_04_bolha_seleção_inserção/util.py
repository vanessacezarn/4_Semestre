import random
class Util:
    @staticmethod
    def popular_lista_aleatoria(lista,quantidade,inicio,final):
        for _ in range(quantidade):
            lista.append(random.randint(inicio,final))

    @staticmethod
    def exibir_lista(lista,frase):
        print(frase)
        for item in lista:
            print(item)
