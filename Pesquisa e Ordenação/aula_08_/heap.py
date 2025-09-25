import time

class Ordenacao:
    @staticmethod
    def heap(lista):
        qtd_trocas = 0
        qtd_comparacoes = 0
        houve_troca = True
        while (houve_troca):
            houve_troca=False
        return qtd_trocas, qtd_comparacoes

def main():
    lista_heap = []
    tempo_inicio = time.perf_counter()
    qtd_trocas, qtd_comparacoes = Ordenacao.heap(lista_heap)
    tempo_fim = time.perf_counter
    tempo_heap = tempo_fim - tempo_inicio
    print(f'Tempo da rotina ordenar por heap: {tempo_heap} s' )
    print(f'Comparações: {qtd_comparacoes} | Trocas: {qtd_trocas}')