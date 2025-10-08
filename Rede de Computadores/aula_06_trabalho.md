# TRABALHO
UM PC RODANDO EM LINUX E OUTRO EM WINDONS 
- Windons: cliente
    - não pode acessar bet365.bet.br 
- Linux : servidor da empresa 316
    - proxy (servidor intermediario, entre o cliente e o servidor de internet)
    - deve bloquear o site : bet365.bet.br 
    - servidor web ➜ apache
        - Apache é um servidor web. Isso significa que ele entrega páginas da web (HTML, CSS, etc.) para os navegadores dos usuários.
    - página html
        - nome do grupo
        - mensagem informando que o acesso foi barrado
    - SSH : (Secure Shell) é um protocolo de rede usado para acessar e gerenciar servidores remotamente de forma segura,
- Linux:
  -  Provedor de Serviços de Internet (ISP)
  -  permiti o acesso (se o servidor da empresa não bloquear, ele também não vai)
  -  rotear os grupos ➜ os grupos vão poder acessar uns aos outros ➜ TEM QUE TER ROTAS
 
LAN : 200.10.0.24
WAN : 192.168.0.12
cada grupo configura um servidor
escolhe um navegador e configura 

---
# PASSOS
## No Windows
1) Configurar no navegador Firefox, que ele tem que acessar a internet por proxy informando o ip do proxy e a porta que foi configurada.
2) Acessar o servidor linux por ssh
3) Configurar o IP da LAN do grupo



## No Linux do grupo

1) Instalar e configurar o servidor web (Apache2)

```
sudo apt update --atualizar a lista de pacotes disponíveis.
sudo apt install apache2 --baixar e instalar o Apache e suas dependências. (já esta instalado)
```
para verificar se  esta instalado abrir "http://localhost" Você deverá ver a página padrão do Apache com a mensagem "It works!".
```
sudo systemctl start apache2 -- inicia o apache (parar = sudo systemctl stop apache2, reiniciar = sudo systemctl restart apache2)
```

3) Criar a página que identifica o grupo e avisa aos usuários que o site solicitado está bloqueado.
```
sudo mkdir -p /var/www/bloqueado --criar pasta para a página
sudo apt install nano --instala editor nano
nano /var/www/bloqueado/index.html --cria pagina html
```
```html
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
Ctrl + X
S
Enter

5) Instalar e configurar o Proxy (squid)

instalar
```
sudo apt install squid -y
sudo systemctl status squid --verifica se squid esta ativo (running)
```
configurar
```
/etc/squid/squid.conf --local onde esta o squi
sudo cp /etc/squid/squid.conf /etc/squid/squid.conf.backup
sudo nano /etc/squid/squid.conf
```
no arquivo /etc/squid/squid.conf adicionar
```
acl minha_rede_local src 200.10.0.24/29
acl sites_bloqueados dstdomain .bet365.bet.br


```


6) Bloquear o site bet365.bet.br por meio do proxy configurado

   
8) instalar um servidor de ssh
9) criar um usuário e colocar ele no grupo do Sudo
10) Acessar o servidor por ssh com o usuário criado.
11) Configurar uma subinterface com o IP da LAN do grupo
12) Configurar a interface física com o endereço da WAN do grupo

## No Servidor Linux do Lab (ISP)

1) Configurar servidor ssh
2) Criar usuário para o grupo
3) colocar o usuário no grupo do Sudo
4) Instalar e configurar um proxy transparente
5) permitir acesso total aos usuário.
6) Criar uma subinterface com o IP de Wan do grupo.
7) Rotear o range de IP do grupo

Todos os grupos devem conseguir acessar a página dos outros grupos


<img width="1105" height="610" alt="image" src="https://github.com/user-attachments/assets/eea891cd-79a8-4a42-8d98-1e4664bccb71" />
