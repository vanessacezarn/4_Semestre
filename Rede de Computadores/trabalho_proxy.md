<h1 align="center">TRABALHO DE PROXY</h1>
 Alunas: Vanessa Cezar e Luiza Karlec
 
---
## ✦ INTRODUÇÃO
O objetivo do trabalho proposto pelo professor consistia em promover a interconexão entre os computadores do laboratório, simulando assim um ambiente de rede local com controle de acesso:
- Utilizando o sistema Windows:
    - foi configurado para agir como cliente: devendo ter seu acesso a determinados sites bloqueado,
    - os endereços dos sites escolhidos são o bet365.bet.br (https) e lasmi.ufn.edu.br (http).
- A responsabilidade por bloquear as páginas é de um segundo computador, este utilizando o sistema Linux,
    - configurado para funcionar como servidor com Proxy (squid).
- Em um terceiro computador, também utilizando Linux: desempenha o papel de servidor central do laboratório.
- Para este grupo foram definidas os IPs para a LAN 200.10.0.24/29 e para WAN 192.168.0.1/30.

Dessa forma, este relatório tem como objetivo descrever os passos e comandos que foram executados durante a realização do trabalho. 
- O relatório está dividido em três partes principais:
    - a primeira aborda as configurações feitas no Windows – cliente,
    - a segunda descreve as configurações feitas no Linux do grupo – servidor proxy
    - a terceira parte trata das configurações do servidor Linux do laboratório – ISP.
- Casa uma dessas seções apresenta as etapas de configurações que foram executas nos computadores, essas etapas consistem em:
    - comandos utilizados no terminal
    -  configurações dos endereços IP definidos para o grupo
    -  configurações para promover bloqueio
    -  instalação de pacotes como o Aapache2, Nano, Squid e SSH
    -  procedimento para criação da página HTML
    -  prints para demonstrar o andamento e resultados das configurações realizadas. 
---
## ✦ CONFIGURAÇÕES WINDOWS - cliente
### 1) Configuração no navegador Firefox
<div align="center">
  <img width="646" height="398" alt="image" src="https://github.com/user-attachments/assets/a7f3c6bb-a1e8-4670-8345-d50d573030f0" />
</div>

### 2) Acessar o servidor Linux por SSH
```
luizavanessa@200.10.0.25
-- nome do usuário do ssh no Linux seguido ip da máquina linux
```
<div align = "center">
  <img width="607" height="702" alt="image" src="https://github.com/user-attachments/assets/949ff156-f926-458c-8125-1fbd85cbcfbb" />
</div>

### 3) Configuração do IP da LAN do grupo
<div align = "center">
  <img width="411" height="450" alt="image" src="https://github.com/user-attachments/assets/fd6bf727-083a-493c-8e79-7d2ffa2f6e8f" />
</div>

---
## ✦ CONFIGURAÇÕES NO LINUX DO GRUPO - servidor proxy
### 1) Instalar e configurar o servido web - Apache2
```
sudo apt update --atualizar a lista de pacotes disponíveis.
sudo apt install apache2 --baixar e instalar o Apache e suas dependências.
sudo systemctl start apache2 -– iniciar o apache
```
### 2) Criar página que identifica o grupo e avisa aos usuários que o site solicitado está bloqueado
#### 2.1) Código para criar uma pasta e a página html
```
sudo mkdir -p /var/www/bloqueado --criar pasta para a página
sudo apt install nano --instala editor nano
nano /var/www/bloqueado/grupoLuizaVanessa.html --cria página html
```
#### 2.2) Código HTML para a página
```HTML
<!DOCTYPE html> 
<html lang="pt-BR"> 
<head> 
   <meta charset="UTF-8"> 
   <title>SITE BLOQUEADO</title> 
</head> 
<body> 
   <h1>ACESSO NEGADO!!!</h1> 
   <p>Você não tem permissão para acessar esse site de apostas</p> 
   <p>GRUPO: Vanessa e Luiza</p> 
</body> 
</html> 

```
observação: para escrever e salvar a página html: CTRL+X ➔ S ➔ ENTER
#### 2.3) Print da tela da página informando o bloqueio
<div align="center">
  <img width="910" height="214" alt="image" src="https://github.com/user-attachments/assets/b95ca0dc-6361-4776-b51d-1d1b06048e9f" />
</div>

### 3) Instalar e configurar o Proxy - Squid
#### 3.1) Instalação
```
sudo apt install squid -y
sudo systemctl status squid --verifica se squid está ativo (running)
```
#### 3.2) Configuração
```
pwd -- verifica o diretório
cd /etc/squid –- entra no diretório
ls –la -– lista os arquivos
sudo nano squid.conf
```
<div align="center">
  <img width="941" height="258" alt="image" src="https://github.com/user-attachments/assets/303bfb2b-97c6-4eb7-bdfd-93609e8b793a" />
</div>
Observação: Para salvar as configurações que foram feitas é necessário parar de rodar o Squid, depois subir ele novo para ler as modificações que foram feitas e, por fim, ver se ele está em running e sem erros.

```
sudo service squid stop
sudo service squid start
```

<div align="center">
  <img width="876" height="559" alt="image" src="https://github.com/user-attachments/assets/5f744276-77f0-4f26-8bef-6ac5dd19a78c" />
</div>


### 4) Bloquear o site bet.365.bet.br(https) e lasmi.ufn.edu.br(http) por meio do proxy configurado

#### 4.1) Acessar o bloqueados.txt
```
sudo nano bloqueados.txt
```
<div align="center">
  <img width="939" height="158" alt="image" src="https://github.com/user-attachments/assets/a0ac176d-9f7c-4da3-8870-ec6307838ad3" />  
</div>

#### 4.2)Salvar as alterações feitos no bloqueados.txt
```
sudo service squid stop
sudo service squid start
sudo service squid status
```
### 5) Instalar um servidor de SSH
```
sudo apt-get install openssh-clientsudo apt-get install openssh-client
```
### 6) Criar um usuário e colocar ele no grupo do Sudo
```
sudo adduser luizavanessa
sudo udermod -aG sudo luizavanessa
```
### 7) Acessar o servidor por SSH com usuário criado
```
laboratorio@LAB24DT04:sudo su
root@LAB24DT04:/home/luizavanessa# su - luizavanessa
```
### 8) Configurar uma subinterface com o IP da LAN do grupo
```
cd /etc/squid -- usado para mudar o diretório
ls –la -– listar arquivos e diretorio 
sudo apt install net-tools –- necessario instalar para utilizar o ifconfig 

```
#### 8.1) Interface antes de criar uma subinterface
<div align="center">
  <img width="941" height="443" alt="image" src="https://github.com/user-attachments/assets/1a49b4c1-ca96-4c6a-9730-5aca75b90324" />
</div>

#### 8.2) Comando para criar a subinterface
```
sudo ifconfig enp0s31f6:1 200.10.0.25 netmask 255.255.255.248
```
#### 8.3) Interface após criar a subinterface
<div align="center">
  <img width="842" height="537" alt="image" src="https://github.com/user-attachments/assets/4201775e-c1ea-48f8-af2c-b13b049922d8" />
</div>

### 9) Configurar a interface física com o endereço da WAN do grupo
<div align="center">
  <img width="827" height="534" alt="image" src="https://github.com/user-attachments/assets/f64abf12-a32c-4f05-9f3b-f886c5ebaf70" />

</div>

---
## ✦ CONFIGURAÇÕES DO SERVIDOR LINUX DO LABORATÓRIO
### 1) Configurar servidor SSH
#### 1.1) Criar usuário para o grupo e colocar o usuário no grupo sudo
<div align="center">
  <img width="812" height="391" alt="image" src="https://github.com/user-attachments/assets/c0819d8c-8b05-4278-bb51-ffc453accfc0" />
</div>

#### 1.2) No servidor proxy acessar o servidor central
```
ssh grupoluizavanessa@192.168.0.14
-- nome do usuário do ssh no servidor central seguido ip da máquina Linux do servidor central

```
<div align="center">
  <img width="684" height="663" alt="image" src="https://github.com/user-attachments/assets/5d080948-52ec-45ad-839e-8d4a85a7269a" />
</div>

### 2) Instalar e configurar um proxy transparente
<div align="center">
  <img width="869" height="686" alt="image" src="https://github.com/user-attachments/assets/aa722e75-ef81-49cb-aff6-a08b430feda5" />
  <img width="892" height="50" alt="image" src="https://github.com/user-attachments/assets/900a8095-bf63-4ffb-9540-fc973b1adcb1" />
</div>

### 3) Criar uma subinterface com IP de WAN do grupo
```
sudo ifconfig enp0s31f6:1 192.168.0.14 netmask 255.255.255.252
if config -- para verificar se funcionou
```
```
sudo ip addr add 192.168.0.14/30 dev enp0s31f6
ip add -- para verificar se funcionou
```
#### 3.4)Rotear o range de IP do grupo
<div align="center"> 
  <img width="941" height="133" alt="image" src="https://github.com/user-attachments/assets/da68f458-1171-4ba9-abe7-29555fb9f3e9" />
<img width="941" height="102" alt="image" src="https://github.com/user-attachments/assets/1ce94b1e-d5be-4f67-a5fe-646aed18709b" />
</div>



---
