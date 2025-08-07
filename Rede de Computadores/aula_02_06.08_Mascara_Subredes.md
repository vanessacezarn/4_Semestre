# Endereço IP
* Exemplo de endereço IP em decimal e em binário:
  * 192.168.1.5 == 11000000.10101000.00000001.00000101
* classe a ➔  1 é o endereço de rede (fixo) e os últimos 3 são host (variam)
* classe b ➔  2 primeiros são endereços de rede (fixos) e os últimos 3 são host (variam)
* classe c ➔  3 primeiros são endereço de rede (fixos) e o último é o host (variável)
## SUBREDES
### Máscara de Subrede de Comprimento Variável (VLSM)
* 32 bits = 8 bits . 8 bits . 8 bits . **8 bits**
* cada octeto pode variar entre 0 e 255
* bit menos significativo == mais da direita é emprestado para o bit do lado --> 1 + 1 = 0
* para saber **quantos ip serão permitidos** tem que fazer 256 - valor do último byte

 ### ✸ PARA TER UMA REDE DE COMPUTADORES:
 * é necessário ter no minimo 2 computadores interligados
   * logo, a máscara de ip 255.255.255.255 não forma uma rede, pois ela permitiria apenas um endereço ip ➔ 256-255=1
* também é necessário ter sempre ter reservado 2 endereços:
   * endereço de rede: primeiro endereço do intervalo ➔ sempre é PAR
   * endereço Broadcast: último endereço do intervalo ➔ sempre é ÍMPAR
      - transmite para todo mundo dentro da rede ao mesmo tempo, e quem estiver na mesma frequência recebe as informações
* dessa forma, a mascara de ip 255.255.255.254 também não forma uma rede pois permite apenas 2 endereços, que seriam usados como endereço de rede e de broadcast
* logo, a primeira máscara que poderá ser utilizada para a menor rede possível é a de 30 bits 1 ➔ 255.255.255.252

### ✸  ENDEREÇOS POSSÍVEIS       
| IP (decimal)| IP (binario) | Nº de bits 1 | Variação | Calculo | Qtd de endereço da rede|
| ------------- | ------------- | ------------ | ------------ | ----------- | ----------|
| 255.255.255.255 | 11111111.11111111.11111111.11111111  | 32 |256-255= 1| |Não é possível ter uma rede
| 255.255.255.254 | 11111111.11111111.11111111.11111110 | 31 | 256-254=2 |  | Não é possível ter uma rede
| 255.255.255.252 | 11111111.11111111.11111111.11111100 | 30 | 256-252=4 |  4 - 2 = 2 | pode ter uma rede com 2 endereços
| 255.255.255.248 | 11111111.11111111.11111111.11111000 | 29 | 256-248=8 | 8 - 2 = 6 | pode ter uma rede com 6 endereços
| 255.255.255.240 | 11111111.11111111.11111111.11110000 | 28 | 256-240=16 | 16 - 2 = 14 | pode ter uma rede com 14 endereços
| 255.255.255.224 | 11111111.11111111.11111111.11100000 | 27 | 256-224=32 | 32 - 2 = 30 | pode ter uma rede com 30 endereços
| 255.255.255.192 | 11111111.11111111.11111111.11000000 | 26 | 256-192=64 |64 - 2 = 62   | pode ter uma rede com 62 endereços
| 255.255.255.128 | 11111111.11111111.11111111.10000000 | 25 | 256-128=128 | 128 - 2 = 124 | pode ter uma rede com 124 endereços
| 255.255.255.0   | 11111111.11111111.11111111.00000000 | 24 | 256-0 | 256 - 2 = 254 | pode ter uma rede com 254 endereços


* a máscara de rede (/nº de bits) depende do administrador de rede ➔ quantos computadores deseja-se ter na rede
* Exemplo: 192.168.1.5
  * se a máscara for /29 : os endereços variam de 8 em 8, até 256 logo: 0-7, 8-15,16-23,24-31,...
  * como o ultimo byte é 5 ➔ o endereço de rede vai variar de 0 a 7
  * o endereço de rede vai ser o primeiro: 192.168.1.0/29 e o endereço de broadcast vai ser o último: 192.168.1.7/29
  * os outros endereços com final:1,2,3,4,5,6 vão estar disponíveis para os outros computadores da rede
* máscara padrão da classe C - 255.255.255.0
* máscara padrão da classe A - 255.0.0.0

### ✸ Transmissão de pacotes:
  * ICMP = informa que alguem quer enviar um pacote
  * ARP = vê se ta mesma vizinhaça
    * Switch na primeira vez manda pra todos pq não ainda não conhece os endereços ligados a ele
  * CSMACD

# CADASTRO CISCO NETOWORK ACADEMY
* BAIXAR cisco packet tracer
* cabo cross over ➔ computador e roteador
* cabo direto ➔ switch e hub ➔ 'não pensam'
## Exercicio usando cisco
* criar duas redes
 * 3 pc ligados a um hub, o hub ligado a um switch, que por sua vez esta ligado a mais 3 computadores
* ip: 200.10.100.64/28

# Exercicio: Endereços rede e broadcast
### A)192.168.15.70/29
<img width="605" height="152" alt="image" src="https://github.com/user-attachments/assets/53383bfc-aa16-4400-b384-010051f8df82" />

### B)200.100.73.125/25
<img width="536" height="124" alt="image" src="https://github.com/user-attachments/assets/8b3307f2-a566-4aba-8c45-f06a8b3591fb" />

### C)10.114.99.202/26
<img width="534" height="119" alt="image" src="https://github.com/user-attachments/assets/0e03a29c-1734-41d6-977f-19790eeb78b8" />

### D)172.25.18.37/27
<img width="501" height="122" alt="image" src="https://github.com/user-attachments/assets/6f345b0a-e6a7-4e2b-af49-3305e4f2ced9" />

### E)40.65.9.190/28
<img width="505" height="128" alt="image" src="https://github.com/user-attachments/assets/d3d2c9dc-50e8-4c39-ba3d-4a60fc0a30b9" />

### F)192.168.100.100/27
<img width="501" height="123" alt="image" src="https://github.com/user-attachments/assets/a24f0be2-d374-4f83-b921-fe6410e4e5dc" />

### G)200.200.4.250/29
<img width="525" height="123" alt="image" src="https://github.com/user-attachments/assets/0186e0ab-7362-4231-b1c7-1877d546216c" />

### H)200.10.120.3/23
<img width="521" height="130" alt="image" src="https://github.com/user-attachments/assets/bc89dfcc-eb19-4d87-8b33-9cf8007ba61e" />

