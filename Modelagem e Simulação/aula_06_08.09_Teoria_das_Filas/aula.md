# TEORIA DAS FILAS
### Anatomia completa de um sistema de filas
- Entrada: cliente chegam com taxa λ (lambda)
- Fila de espera:
- Servidores:
- Disciplinas:
- Saída:
- Fórmula principal:
```
 ρ = λ/(c×μ)
em que:
 ρ = ocupação;
 λ = chegadas/tempo;
 μ = atendimentos/tempo por servidor;
 c = nº de servidores
```
#### Medindo a taxa de chegada (λ)
#### Medindo a taxa de atendimento (μ)
- Tempo médio de atendimento = soma da duração de cada atendimento / quantidade de atendimentos
- Fórmula: μ = 1 ÷ Tempo Médio de Atendimento
- Legenda: μ (mi) = taxa de atendimento por servidor em atendimentos por unidade de tempo
#### TAXA DE OCUPAÇÃO (ρ) - o termômetro do sistema
- ρ < 0,7 ➔ VERDE ➔ sistema tranquilo, servidores têm tempo livre
- 0,7 < ρ < 0,9 ➔ AMARELO ➔ sitema ocupado, servidores quase sempre trabalhando
- p >= 0,9 ➔ VERMELHO ➔ sistema no limite, qualquer variação causa problemas
- p >= 1 ➔ CRÍTICO ➔ impossível manter ➔ chega mais pessoas do que é possível atender
- p = 1 é o limite
  - se p = 1 ➔ chegadas = capacidade de atendimento ➔ equilíbrio perfeito
  - se p > 1 ➔ chegam mais pessoas do que conseguimos atender
  - Resultado: a fila cresce sem parar, nunca conseguimos "zerar" ela.
#### LEI DE LITTLE - a fórmula mágica
#### DISCIPLINAS DE ATENDIMENTO COMPARADAS
- FIFO : primeiro a chegar, primeiro a ser atendido
- LIFO : último a chegar, primeiro a ser atendido
- Prioridade: atendimento por ordem de importância
-  Aleaátorio: atendimento em ordem aleatória
  
### INTERPRETANDO OS RESULTADOS - guia de decisão
- ρ < 0,5 ➔ sistema subutilizado
- 0,5 < ρ < 0,8 ➔ sistema eficiente
- 0,8 < ρ < 1 ➔ sistema no limite
- p >= 1 ➔ sistema em colapso
