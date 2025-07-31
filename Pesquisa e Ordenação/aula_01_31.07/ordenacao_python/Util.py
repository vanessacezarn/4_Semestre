import random

class Util:
    """_summary_
        classe util é  responsavel por métodos de gestão de listas de números inteiros e listas de palavras
    """
    
    
    @staticmethod    
    def popular_aleatorio_numeros(lista,quantidade,inicio,fim):
        """_summary_
                método de classe que popula uma lista de números inteiros com valores aleatorios
        Args:
            lista (int): _description_ estrutura  de armazenamento dos números
            quantidade (int): _description_de números a serem gerados
            inicio (int): _description_valor inicial da extensão do numero gerado
            fim (int): _description_valor final da extensão do numero gerado
        """
        for _ in range(quantidade):
            lista.append(random.randrange(inicio,fim))
    
    @staticmethod
    def exibir_lista(lista):
        """_summary_
            exibe uma lista de números inteiros
        Args:
            lista (int): _description_contem números inteiros
        """
        for item in lista:
            print(item)       
    
    @staticmethod
    def popular_aleatorio_palavras(lista,quantidade,tamanho):
        letras = "abcdefghijklmnopqrstuvwxyz"
        for _ in range(quantidade):
            palavra_gerada = ""
            letra_sorteada = ""
            for i in range(tamanho):
                letra_sorteada = letras[random.randrange(len(letras))]
                palavra_gerada = palavra_gerada + letra_sorteada
                

            lista.append(palavra_gerada)

         
