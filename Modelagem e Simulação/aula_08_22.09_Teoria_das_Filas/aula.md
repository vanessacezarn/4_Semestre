# Fila M/M/C
## Vantagens dos Múltiplo Servidores
- redução significativa do tempo de espera
- melhor aproveitamento da capacidade total
- maior flexibilidade operacional
- menor variabilidade nos tempos de espera
- Exemplo prático:
    - call center: vários atendentes para uma fila de chamadas
    - supermercado: sistema de fila única para vários caixas
## O que significa M/M/c
Chegadas Poisson, serviço exponencial, c servidores idênticos
### primeiro M
### segundo M
### número c
## Hipótesees do Modelo M/M/c
## Utilização em M/M/c
## Fórmula de Erlang C
- calcula a probabilidade de um cliente ter que esperar:
$$P(\text{wait}) = \frac{ \left( \frac{a^c}{c!} \times \frac{c}{c - a} \right) }{ \sum (\frac{a^n}{n!}) + \left( \frac{a^c}{c!}) \times (\frac{c}{c - a} \right) }$$
- somatório vai de n = 0 até n=c-1
- Legenda:
    - $a = \frac{λ}{μ}$ ➔ tráfego oferecido, em Erlangs
    - c = números de servidores
    - $ρ = \frac{a}{c} = \frac{λ}{c*μ}$ ➔ utilização média por servidor
    - P(wait) = probabilidade de esperar na fila
### Interpretando Erlang C
- P(wait) = probabilidade de esperar na fila
    - P(wait) = 0.10 ➔ 10% dos clientes esperam na fila
    - P(wait) = 0.25 ➔ 25% dos clientes esperam na fila
    - P(wait) = 0.50 ➔ 50% dos clientes esperam na fila
#### Fatores que influenciam P(wait)
- Utilização (ρ) ➔ quanto maior, maior P(wait)
- Número de servidores (c) ➔ quanto maior, menor P(wait)
- Variabilidade do serviço ➔ exponencial gera mais espera
## Métricas de Desempenho M/M/c
## VANTAGENS DO M/M/c
## QUANDO USAR M/M/c
## DIMENSIONAMENTO PRÁTICO
### Regras práticas de dimensionamento
## Limitações do M/M/c
## Ferramentas para cálculo
## TEMPLATE DE CÁLCULO M/M/c
## Análise Econômica
## Monitoramento e Controle
## Extensões do Modelo
### M/M/c/K (capacidade limitada)
### M/M/c com prioridade
### M/M/c com abandono
