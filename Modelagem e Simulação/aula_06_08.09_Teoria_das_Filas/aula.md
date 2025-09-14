# TEORIA DAS FILAS
### Anatomia completa de um sistema de filas
- Entrada: cliente chegam com taxa λ (lambda)
- Fila de espera: capacidade limitada ou ilimitada
- Servidores: 'c' atendentes, cada um com uma taxa 'μ (mi)'
- Disciplinas: Regras de atendimento - FIFO, prioridades,...
- Saída: Clientes atendidos deixam o sistema
- Fórmula principal:  $ρ = \frac{ λ}{ μ * c}$
  - ρ = ocupação;
  - λ = chegadas/tempo;
  - μ = atendimentos/tempo por servidor;
  - c = nº de servidores
- capacidade total de sistema = c * μ
  
## ✦ Medindo a taxa de chegada (λ)
- medição: quantas pessoas chegaram em um perído fixo
- a taxa pode mudar ao longo do dia ➔ vale, pico
  - importante medir em diferentes horários para ter uma média realista
- fórmula:  $λ = \frac{nº chegadas}{tempo Observação}$
   - λ ➔ taxa de chegada em pessoas por unidade de tempo
     
## ✦ Medindo a taxa de atendimento (μ)
- medição: cronometrar vários atendimentos individuais
- Tempo médio de atendimento = soma da duração de cada atendimento / quantidade de atendimentos
- Fórmula: $μ = \frac{1}{Tempo Médio de Atendimento}$
  -  μ (mi) = taxa de atendimento por servidor em atendimentos por unidade de tempo
  
## ✦ TAXA DE OCUPAÇÃO (ρ) - o termômetro do sistema
- Fórmula:  $ρ = \frac{λ}{ μ * c}$
- ρ < 0,7 ➔ VERDE ➔ sistema tranquilo, servidores têm tempo livre
- 0,7 < ρ < 0,9 ➔ AMARELO ➔ sitema ocupado, servidores quase sempre trabalhando
- p >= 0,9 ➔ VERMELHO ➔ sistema no limite, qualquer variação causa problemas
- p >= 1 ➔ CRÍTICO ➔ impossível manter ➔ chega mais pessoas do que é possível atender
- p = 1 é o limite
  - se p = 1 ➔ chegadas = capacidade de atendimento ➔ equilíbrio perfeito
  - se p > 1 ➔ chegam mais pessoas do que conseguimos atender
  - Resultado: a fila cresce sem parar, nunca conseguimos "zerar" ela.
- REGRA PRÁTICA: sempre manter ρ entre 0,7 e 0,85 para ter uma operação estável
   - alguns atendimentos demoram mais, atendentes podem precisar de pausa e equipamentos podem dar problemas 

## ✦ LEI DE LITTLE - a fórmula mágica
- relaciona quantidade de pessoas no sistema com tempo de permanência
- Fórmulas principais: $L = λ * W$ e $Lq = λ * Wq$
   - L = pessoas no sistema | Lq = pessoas na fila
   - W = tempo total no sistema | Wq = tempo apenas na fila
      
## ✦ DISCIPLINAS DE ATENDIMENTO COMPARADAS
- FIFO (First In, First Out) : primeiro a chegar, primeiro a ser atendido
- LIFO (Last In, First Out): último a chegar, primeiro a ser atendido
- Prioridade: atendimento por ordem de importância
-  Aleaátorio: atendimento em ordem aleatória
  
## ✦ INTERPRETANDO OS RESULTADOS - guia de decisão
- ρ < 0,5 ➔ sistema subutilizado
   - muitos atendentes ociosos, custo alto  ➔ reduzir pessoal ou expandir o serviço
- 0,5 < ρ < 0,8 ➔ sistema eficiente
   - boa utilização, espera baixa ➔ manter configuração 
- 0,8 < ρ < 1 ➔ sistema no limite
   - filas longas em picos, clientes insatisfeitos ➔ adicione 1 atendente ou melhore o processo 
- p >= 1 ➔ sistema em colapso
   - fila cresce infinitamente ➔ adicionar vários atendentes urgentemente  
