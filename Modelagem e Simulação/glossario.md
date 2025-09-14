## MODELAGEM
- conjunto de técnicas que traduzem fenômenos reais em representações matemáticas que podem ser simuladas em computadores
- objetivo: criar representações úteis para estudar sistemas complexos
### Tipos de modelagem
* **Determinística** ➔ resultado único e previsível para um conjunto de entradas ➔ não há incerteza
* **Estocástica** ➔ incorpora elementos aleatóriosm produzindo resultados diferentes ➔ comportamento futuro é previsto apenas com certa probabilidade
* **Baseada em Agentes** ➔ simula comportamento individuais que geram padrões coletivos
### Conceitos importantes
* Modelo: representação matemaática ou algoritmica de um sistema real
* Simulação: execução do modelo no computador para observar seu comportamento
* Sistema: conjunto de elementos que interagem para alcançar um objetivo comum
* Variáveis características mensuráveis do sistema que podem mudar
* Parâmetros: valores que controlam o comportamento do modelo
### Processo de modelagem
Definição do problema ➔ Coleta e Análise de dados ➔ Formulação Matemática ➔  Implementação Computacional ➔ Validação e Calibração ➔ Análise de Resultados ➔ Refinamento e Otimização
### Sistema Contínuos
- variáveis mudam de forma suave ➔ qualquer valor dentro de um intervalo (casas decimais, frações,...)
- equações diferencias ➔ $\frac{dy}{dx} = f(t,y)$
- tempo como variável contínua
### Sistemas Discretos
- valores específicos (inteiros) ➔ mudanças em instantes pontuais
- equações de diferença ➔ $x[n+1] = f(x[n]))$
- tempo em intervalos discretos ➔ não existe meio termo entre dois instantes

---

## TEORIA DAS FILAS
### Taxa de chegada (λ)
- quantas pessoas chegaram em um perído fixo
- fórmula:  $λ = \frac{nº chegadas}{tempo Observação}$
### Taxa de atendimento (μ)
- Tempo médio de atendimento = soma da duração de cada atendimento / quantidade de atendimentos
- Fórmula: $μ = \frac{1}{Tempo Médio de Atendimento}$  
### Taxa de ocupação (ρ)
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
#### Interpretação dos resultados
- ρ < 0,5 ➔ sistema subutilizado ➔ muitos atendentes ociosos, custo alto  ➔ reduzir pessoal ou expandir o serviço
- 0,5 < ρ < 0,8 ➔ sistema eficiente ➔ boa utilização, espera baixa ➔ manter configuração 
- 0,8 < ρ < 1 ➔ sistema no limite ➔ filas longas em picos, clientes insatisfeitos ➔ adicione 1 atendente ou melhore o processo 
- p >= 1 ➔ sistema em colapso ➔ fila cresce infinitamente ➔ adicionar vários atendentes urgentemente  
### Disciplinas de atendimento
- FIFO (First In, First Out) : primeiro a chegar, primeiro a ser atendido
- LIFO (Last In, First Out): último a chegar, primeiro a ser atendido
- Prioridade: atendimento por ordem de importância
-  Aleaátorio: atendimento em ordem aleatória
