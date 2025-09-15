## PROCESSO DE CHEGADA E ATENDIMENTO
## DISCIPLINA DA FILA E CAPACIDADE
## NOTAÇÃO DE KENDALL
- sistema padronizado para classificar modelos de fila ➔ **A/B/c/K/N/D**
- legenda:
  - A ➔
  - B ➔
  - c ➔
  - K ➔
  - N ➔
  - D ➔ 
## M/M/1
### PRIMEIRA M - CHEGADAS (processo de Poisson)
- chegadas independentes e aleátorias
- taxa de chegada (λ) constante ao longo do tempo
- intervalos entre chegadas seguem distribuição exponencial
- probabilidade de chegada não depende do histórico
### SEGUNDA M - SERVIÇOS (distribuição exponencial)
- tempos de serviço independentes
- taxa de atendimento (μ) constante
- tempo restante de serviço não depende do tempo já decorrido
- propiedade 'sem memória' simplifica a análise matemática
### O NÚMERO 1 - UM SERVIDOR
- sistema possui exatamente um canal de atendimento ➔ apenas um cliente pode ser atendido simultaneamente
### HIPÓTESES DO MODELO
### QUANDO USAR M/M/1
#### VANTANGENS
#### LIMITAÇÕES
### EXEMPLOS PRÁTICOS DE APLICAÇÃO
## O QUE MEDIR EM UMA FILA
## TAXA DE CHEGADA (λ) E TAXA DE ATENDIMENTO (μ)
## UTILIZAÇÃO DO SISTEMA (ρ)
- representa a fração de tempo que o servidor está ocupado
- $ρ = \frac{λ}{μ}$
- **FUNDAMENTAL PARA ESTABILIDADE** ➔ ρ DEVE ses < 1
### Interpretação
- ρ = 0.5 ➔
- ρ = 0.8 ➔
- ρ = 0.95 ➔
### Impacto no Desempenho
- ρ < 0.7 ➔
- 0.7 <=ρ < 0.9 ➔
- ρ >= 0.9 ➔
## NÚMERO MÉDIO NO SISTEMA E NA FILA
### Número médio no sitema (L)
- quantidade média de clientes no sistema ➔ sendo atendidos + esperando
- $L = \frac{ρ}{1 - ρ} $
### Número médio na Fila (Lq)
- quantidade média de clientes aguardando na fila ➔ exclui quem está sendo atendido
- $Lq = \frac{ρ²}{1-ρ}$

- Relação: $L = Lq + ρ$ ➔ sempre há ' ' clientes sendo atendidos em média
- Comportamento : quando ' ' aumenta, L e Lq crescem rapidamente
- QUANDO ρ ➔ 1, tanto L quanto Lq ➔ ∞
### Tempo Médio no Sistema (W)
- tempo total que um cliente passa no sistema ➔ espera + atendimento
- $W = \frac{1}{μ - λ} $
### Tempo Médio na Fila (Wq)
- tempo que um cliente passa esperando antes de ser atendido
- $Wq = \frac{λ}{μ(μ - λ)}$
### Lei de Little
- Conecta quantidades médias com tempos médios
- $L = λ * W$ | $Lq = λ * Wq$    
## FÓRMULAS PRINCIPAIS DO M/M/1
## M/M/c
