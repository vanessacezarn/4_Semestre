# Fila M/M/C
## ✹ Vantagens dos Múltiplo Servidores
- redução significativa do tempo de espera
- melhor aproveitamento da capacidade total
- maior flexibilidade operacional
- menor variabilidade nos tempos de espera
- Exemplo prático:
    - call center: vários atendentes para uma fila de chamadas
    - supermercado: sistema de fila única para vários caixas
## ✹ O que significa M/M/c
Chegadas Poisson, serviço exponencial, c servidores idênticos
### ✶ primeiro M
* processo de chegada MARKOVIANO (Poisson)
* taxa de chegada constante
* chegadas independentes e aleatórias
### ✶ segundo M
* tempo de serviço Makoviano (exponencial)
* taxa de atendimento μ por servidor
* tempos de serviços independentes
### ✶ número c
* sistema possui exatamente c servidores
* todos os servidores são idênticos
* capacidade total do sistema = c * μ
## ✹ Hipótesees do Modelo M/M/c
* chegadas seguem processo de Poisson (taxa λ)
* tempos de serviço exponenciais (taxa μ por servidor)
* c servidores idênticos e independentes
* fila única alimentando todos os servidores
* Disciplina FIFO, primeiro a chegar, primeiro a ser atendido
* capacidade infinita da fila
* população fonte infinita
### ✶ Condição de Estabilidade
- $ρ=\frac{λ}{c*μ} < 1$
- Taxa de chegada < capacidade total do sistema ➔ λ < c×μ 
- se ρ > = 1, a fila cresce indefinidamente
## ✹ Utilização em M/M/c
- utilização do sistema : $ρ=\frac{λ}{c*μ}
- ρ = 0.6 ➔ cada servidor ocupado 60% do tempo em média
- ρ = 0.8 ➔ cada servidor ocupado 80% do tempo
- ρ = 0.9 ➔ sistema sob alta pressão
## ✹ Fórmula de Erlang C
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
## ✹ Métricas de Desempenho M/M/c
- a partir do P(Wait), calcula-se todas as outras métricas
- Tempo médio de espera na fila (Wq) ➔ $Wq =\frac{P(Wait) * 1}{(c*μ - λ)}$
- Número médio na Fila (Lq) ➔ $Lq = λ * Wq$
- Tempo médio no Sistema (W) ➔ $W = Wq + \frac{1}{μ}$
- Número Médio no Sistema (L) ➔ $L = λ * W$
- Lei de Little (verificação) ➔ $L = λ * W$ e $Lq = λ * Wq$
## ✹ VANTAGENS DO M/M/c
### ✶ Pooling Effect (efeito de agrupamento)
* variabilidade individual é absorvida pelo grupo
* servidores ociosos compensam os ocupados
* redução dramática da variabilidade total
### ✶ Melhor Utilização de Recursos
* não há servidores completamente ociosos
* carga distribuida automaticamente
* economia de escala no dimensionamento
### ✶ Justiça no Atendimento
* todos esperam na mesma fila ➔ não há 'escolha errada' de fila
* tempo de espera mais previsível
### ✶ Flexibilidade Operacional
* fácil ajuste do número de servidores
* adaptação rápida a variações de demanda
## ✹ QUANDO USAR M/M/c
* há múltiplos servidores idênticos
* **Existe uma fila única alimentando todos**
* servidores podem atender qualquer cliente
* chegadas são idependentes e aleátorias
* tempo de serviços são variáveis
#### Não usar quando cada servidor tem especialização diferente, há filas separadas por servido e serviços tem prioridades diferentes
### exemplos típicos
* call center com distribuição automática
* banco com sistema de senha
* caixa de supermecado com fila única (caixas rápidos)
## ✹ DIMENSIONAMENTO PRÁTICO
Como dimensionar o número de servidores
### Passo 1: Definir Meta de Nível de Serviço
* P(Wait) máximo aceitável
* Wq máximo aceitável
* Custo por servidor
### Passo 2: Medir Parâmetros do Sistema
* taxa de chegada λ (período representativo)
* taxa de atendimento μ por servidor
* variabilidade dos tempos
### Passo 3: Testar Diferentes Valores de c
* começar com c mínimo para estabilidade
* cacular P(Wait) para cada c
* encontrar menor c que atende a meta
### Passo 4: Análise Custo-Benefício
* custo adicional de cada servidor
* benefício da redução de espera
* ponto ótimo econômico
### ✶ Regras práticas de dimensionamento
- Utilização recomendada
    - ρ <= 0.7 ➔ sistema confortável, baixa espera
    - 0.7 < ρ < 0.8 ➔ sistema eficiente, espera modereda
    - 0.8 < ρ <0.9 ➔ sistema sob pressão, monitorar
    - ρ > 0.9 ➔ sistema crítico, risco de colapso
- número mínimo de servidores
    - c >= λ/μ ➔ para estabilidade básica
    - c >= 1.2 * λ/μ ➔ para operação confortável
- Regra dos 80/20
    - 80% da melhoria vem dos primeiros servidores
    - servidores adicionais têm retorno decrescente 
    - encontrar ponto de equilíbrio custo-benefício
- Planejamento de capacidade
    - considerar crescimento fututro (10-20%)
    - prever picos sazonais
    - manter margem de segurança      
## ✹ Limitações do M/M/c
### ✶ Limitações das hipóteses
* chegadas perfeitamente aleatórias ➔ Poisson
* tempos de serviços exponenciais ➔ alta variabilidade
* servidores idênticos e idenpendentes
* capacidade infinita da fila
* sem abandono de clientes
### ✶ Quando não usar M/M/c
* chegadas em lotes ou com padrões
* tempos de serviço muito regulares
* servidores com especialidades diferentes
* capacidade limitada da fila
* alta taxa de abondono
* prioridades entre clientes
### ✶ Alternatia
* M/G/c ➔ serviço com distribuição geral
* M/M/c/K ➔ capacidade limitada
* Simulação para casos complexos
## ✹ TEMPLATE DE CÁLCULO M/M/c
1) medir λ e μ (mesmas unidades)
  2) Definir c (números de servidores)
  3) Calcular ρ = λ/(c×μ) e verificar ρ < 1
  4) Calcular P(Wait) usando Erlang C
  5) Calcular Wq, Lq, W, L
  6) Verificar Lei de Little
## ✹ Análise Econômica
- Custo total = Custo de servidores + custo de espera
- Custo de Servidores
    - sálarios, beneficios, treinamento
    - equipamentos, espaço físico
    - cresce linearmente com c 
- Custo de Espera
    - perda de produtividade dos clientes
    - instatisfação e abandono
    - perda de vendas/oportunidades
    - descresce com aumento de c (número de servidores) 
- Ponto Ótimo
    - minimiza custo total
    - balanceia investimentos vs benefício
    - considera valor do tempo dos clientes 
## ✹ Monitoramento e Controle
KPIs (Key Perfomace Indicator ou Indicador chave de desempenho) para sistemas M/M/c
### ✶ Métricas de Desempenho
* P(Wait): % de clientes que esperam
* Wq: tempo médio de espera
* W: tempo médio no sistema
* Lq: fila média
* Taxa de abandono
### ✶ Métricas de Utilização
* ρ: utilização média dos servidores
* Distribuição de carga entre servidores
* Tempo ocioso por servidor
### ✶ Alertas e Limites
* ρ > 0.85: alerta amarelo
* ρ > 0.90: alerta vermelho
* P(wait) > meta: ação corretiva
### ✶ Ações corretivas
* adicionar servidores temporários
* redistribuir carga
* melhorar processo de atendimento
## ✹ Extensões do Modelo
### ✶ M/M/c/K (capacidade limitada)
* máximo K clientes no sistema
* clientes são rejeitados quando sistema lotado
* usado quando há limitação física
### ✶ M/M/c com prioridade
* diferentes classes de clientes
* atendimento por ordem de prioridade
* usado em emergências
### ✶ M/M/c com abandono
* clientes desistem após tempo limite
* taxa de abandono dependendo do tempo
* usado em call centers, e-commerce
