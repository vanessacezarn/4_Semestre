TRABALHO CALCULADORA EARLING
Nome: VANESSA CEZAR DO NASCIMENTO Data: 22/09/2025

No trabalho foi escolhido para o cálculo das métricas de desempenho do M/M/c a opção B disponibilizada no comando da atividade, ou seja, foram desenvolvidas várias funções, uma para o cálculo de cada uma das métricas, pois acredito que elas separadas geram uma maior organização do codigo, além de facilitar a reutilização e futuras manutenções.

Utilização do programa:

Entradas: possui duas entradas disponiveis, a primeira solicita que seja digitado o tráfego oferecido (a) e a quantidade de servidores (c), já a segunda entrada pede para digitar a taxa de chegada(λ), a taxa de atendimento por servidor(μ)e o número de  servidores (c).
  
Saidas: P(wait): probabilidade de um cliente precisar esperar na fila.
          ρ: utilização média por servidor.
          Wq: tempo médio de espera na fila.
          Lq: número médio de clientes na fila.
          W : tempo médio de permanência no sistema.
          L : número médio de clientes no sistema.

Unidade: tempo em minutos.

Validações: μ > 0 e c > 0
              Entradas numéricas (valores inválidos são tratados com mensagem)
              Caso a ≥ c, o programa considera o sistema instável P (wait) = 1 e informa que Wq, Lq, W, L → ∞.
