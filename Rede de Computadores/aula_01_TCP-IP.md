# Apresentação da disciplina
### Unidade 1 - TCP/IP
### Unidade 2 - Roteamento estático
### Unidade 3 - Servidores Linux
### Unidade 4 - Rotamento dinâmico

# TCP-IP
## ✦ Fluxo de dados
* cada camada recebe dados da camada superior
  * acrescenta cabeçalho com informações para criar nova unidade de dados 
  * passa nova unidades de dados para camada inferior 
* 5 camadas
  * aplicação --> manda mensagem
  * transporte --> segmentos da mensagem
  * rede --> datagrama
  * enlace --> quadros, pequenos pedaços da mensagem
  * física
* Protocolos de cada camada 
  * aplicação: Telnet, FTP, SMTP, SNMP
  * transporte: Protocolo TCP e UDP
  * rede: ICMP, ARP, RARP
  * enlace: Protocolo de Quadros
  * física: Proocolo Físico
<img width="650" height="299" alt="image" src="https://github.com/user-attachments/assets/5c0683fb-0a8d-465d-b33e-d9ffbfff108e" />
<img width="640" height="318" alt="image" src="https://github.com/user-attachments/assets/debe1dc6-46d5-4bc3-bd1f-c04d5d72b34a" />

# ✦ CAMADA DE ENLACE - o suporte
## Subcamda de acesso ao meio
* trata dos problemas e protocolos para acesso ao meio, ou canal, de comunicação em redes de difusão, onde múltiplos usuários, estações, tem de competir entre si para usar o meio de transmissão
* os protocolos usados para determinar quem usa a rede na próxima vez pertencem à subcamada de acesso ao meio, chamada de controle de acesso ao meio -MAC
### ✸ Camada de enlace é subdividida em 2 partes:
* LLC - Logical Link Control
  * gerencia o aceeso à rede e garante comunicação confiável entre dispositivos 
  * fornece serviços para a camada de rede, permitindo que múltiplos protocolos e tipos de redes se comuniquem de forma transparente
  * atua como uma camada de abstração, escondendo as complexidades de diferentes tecnologias de rede e permitindo que a camada de rede se concentre em roteamento e controle de dados 
* **MAC - Media Access Control**
  * é único para cada dispoditivo na rede
  * valor hexadecimal formado por 6 partes(cada parte 2 números hexa):
        * 3 primeiras são referentes ao fabricante
        * 3 ultimas são referntes ao número de série
  * é o mesmo em qualquer lugar do mundo
  * protocolo que define como os dispositivos compartilham um meio de comunicação
  * controla o acesso ao meio de comunicação
     * garante que apenas um dispositivo transmita dados por vez

### ✸ Problemas da alocação do canal
* como controlar o acesso a um canal de transimissão compatilhados por N usuários:
  * **Alocação Estática** de Canal em LANs e MANs  --> ocorre uma divisão segundo prioridades
      * dividir a banda passante (W) em N faixas
      * problemas:
        * diminuir a taxa de transmissão disponível para cada usuário (banda passante de cada usuário passa a ser W/N), logo a taxa de transmissão é menor
        * quando um usuário não transmite, o canal é desperdiçado (vai acontecer muito porque o tráfego típico em LAN/MAN é em rajada)  
  * **Alocação Dinâmica**de Canal em LANs e MANs  --> quem chega primeiro usa
     * Modelo de Estações (Station Model)
       * N estações independentes cada uma com um programa/usuário gerando quadros para transmissão
     * Presunção de Canal Único (Single Channel Assumption)
       * um único canal está disponível para transmissão/recepção das N estações
     * Presunção de Colisão  (Collision Assumption)
       * dois quadros transmitidos ao mesmo tempo colidem e são deteriorados, exigindo retransmissão
## ✦ PROTOCOLOS DE ACESSO MÚLTIPLO
### ✸ Colisão
* um evento que ocorre frequentemente nas redes, no qual dois computadores tentam enviar informações no mesmo instante
* as  colisões são normais no funcionamento de uma rede, entretanto se forem muito frequentes, o desempenho da rede será prejudicado
* o tratamento de colisões é feito usando o algoritmo **Binary Exponential Backoff** - recuo binário exponencial
  * Fatia-de-tempo = tempo de 1 quadro percorrer o cabeamento
  * Transmissão
  * Enquanto houver colisão:
    * 1º colisão --> espera 0 ou 1 fatia-de-tempo
    * 2º colisão --> espera 0,1,2 ou 3 fatia-de-tempo
    * 3º colisão --> espera 0,1,...,7 fatia-de-tempo
    * Nª colisão --> espera 0,1,..., $2^N-1$ fatias-de-tempo para N<=10 sempre
  * Tranmissão
* o algoritmo é adaptaivo à quantidade de colisões  
## ✦ TRANSMISSÃO DE DADOS
### ✸ Transmissão em tempo contínuo - continous time
* um quadro pode ser transmitido a qualquer tempo
* não existem um relógio mestre dividindo o tempo em intervalos discretos (fatias) 
### ✸ Transmissão em tempo fatiado - Slotted Time
* um quadro só pode ser transmitido em uma fatia de tempo
* uma fatia de tempo pode conter 0,1, ou mais quadros, indicando uma fatia vazia, com um quadro ou colisão, respctivamente
### ✸ Transmissão com teste de portadora - Carrier Sense
* uma estação pode testar se o canal está livre para, somente nesse caso, iniciar sua transmissão
### ✸ Transmissão sem teste de portadora - No Carrier Sense
* uma estação não pode testar se o canal está livre

## ✦ PROTOCOLOS DE ACESSO MÚLTIPLO 
### ✸ Aloha 1970
* Um dos primeiros a ser desenvolvido
* Principio de funcionamento de uma estação que quer transmitir um quadro:
  * estação transmite quadro
  * estação escuta o canal para receber o quadro que ela mesma transmitiu
  * se receber o quadro, a transmissão foi um sucesso
  * se não receber, houve colisão
    * espera um tempo aleátorio, crescente, e retransmite
* esse sistema é chamado de transimissão com contenção
* Eficiência: aproximadamente: 18%   
### ✸ Aloha Fatiado - 1972
* principio de funcionamento de uma estação que quer transmitir um quadro
   * estação aguarda marca de tempo para poder transmitir o quadro
   * o restante do comportamento é igual ao Aloha
* Eficiência: aproximadamente 36%
  * dobrou a capacidade de entrar pacotes

### ✸ CSMA - Carrier Sense Multiple Acess (1-persistente)
* principio de funcionamento de uma estação que quer transmitir um quadro
   * estação testa o canal para ver se está livre
   * se estiver ocupado, aguarda ficar livre testando continuamente
   * o restante do comportamento é igual ao Aloha
* eficiência : aproximadamente 50%

### ✸ CSMA - Carrier Sense Multiple Acess (Não persistente)
* principio de funcionamento semelhante ao CSMA-1
  * quando o canal está ocupado, aguarda um tempo aleatório, crescente, antes de tentar de novo
* eficiência: aproximadamente 85%, mas com atraso alto

### ✸ CSMACD - Carrier Sense Multiple Acess Collision Detection
* ideia: além de não iniciar com a transmissão com o canal ocupado, interrompe uma transmissão tão logo seja detectada colisão (verifica se os bits do pacote estão corretos, se tem endereço de entrega e remente)
* quando ocorre colisão, aguarda um tempo aleatório, crescente para retransmitir
* é a base fo IEEE 802.3 atual - conhecido por protocolo Ethernet

# CAMADA DE REDE - IP
## ✦ FUNÇÕES DA CAMADA DE REDE
### ✸ Routing
* a escolha do caminho tomando pelos pacotes da origem até o destino - algoritmos de roteamento
### ✸ Switching - comutação
* comutar os pacotes da interface de entrada para a interface de saída
* switch -> sabe para qual maquina tem que mandar o pacote --> EVITA as colisões na rede
* hub -> manda para todas as maquinas --> mais rapido --> com uma grande rede acontece muitas colisões
### ✸ Call Setup - estabelecimento de circuito
* alguma arquiteturas de rede requerem que os routers estabeleçam um circuito virtual antes de os hosts poderem se comunicar

### ✸ DATAGRAMPA IP
<img width="651" height="379" alt="image" src="https://github.com/user-attachments/assets/8a422544-2090-4743-8272-9ac3f7649e87" />

### ✸ Endereço  IP
* um endereço IP não identifica um computador específico
* endereço ip é único por placa de rede, não por computador 
* Cada endereço IP identifica uma conexão entre um computador e uma rede
* Um computador com conexões de rede múltiplas, como router, deve ser atribuído um endereço IP para cada conexão
* função: fornece uma abstração
* independente do endereçamento de hardware (MAC)
* Utilizado por :
  * protocolos de camada mais alta
  * aplicações 
* Virtual
  * só reconhecido por software
* utilizado por toda a comunidade numa rede de interconexão  
* IPv4 inteiro de 32 bits
* valor distinto para cada computador/interface
* dividido em 2 partes: <ins>172.25.2. </ins>**212**
   * prefixo identifica a <ins>rede</ins>
   * sufixo identifica o computador/interface -> **host**
* autoridade global atribui um prefixo distinto para a rede
   * Brasil: 200, 201
* administrador local atribui sufixo distinto para o computador/interface
   * ufn: <ins>200.132.59</ins>.2 
* um endereço de **IP (V4)** possui 32 bits (4 Bytes) está dividido em 2 grupos: Endereço de Rede e Endereço de Host (máquina) de acordo com sua classe
<img width="476" height="210" alt="image" src="https://github.com/user-attachments/assets/c95f585a-3094-4a0d-b100-0235bc928034" />
<img width="462" height="220" alt="image" src="https://github.com/user-attachments/assets/12ca80e3-5c39-4ed1-b12d-f2cb79eb4b8b" />

   * nessa versão existem 4294967196 IPs disponíveis (256x256x256x256)
   * classe A,B,C,D,E --> distribuida pela RNP
     * classe A ➔ primeiro byte ➞ 1 até 127
       * exemplo: 10.168.10.15
         * rede: 10
         * host: .168.10.15
     * classe B ➔ 2 primeiros bytes ➞ valor do 1º byte: 128 até 191
       * exemplo: 172.25.10.15
         * rede: 172.25
         * host: .10.15 
     * classe C ➔ 3 primeitos bytes ➞ valor do 1º byte: 192 até 223
       * exemplo: 192.168.10.15
         * rede: 192.168.10
         * host: .15  
     * classe D ➞ 224 até 239 e E ➞ 240 até 255 não são utilizadas
   * cada byte é chamado de Octeto (8 bits) que podem variar variar de 00000000 a 11111111 ou de 0 a 255
   * as máquinas, host, podem enxergar apenas seus vizinhos, para que se vejam entre as vizinhanças, é necessário que existam roteadores e rotas
     
### ✸ Subnetting - subredes
### ✸ Máscara de Subrede de Comprimento Variável - VLSM 





















