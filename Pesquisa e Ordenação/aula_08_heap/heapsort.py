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
