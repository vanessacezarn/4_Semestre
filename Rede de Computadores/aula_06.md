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

```
# Instalar Apache (servidor web)
sudo apt install apache2 -y

# Criar página de bloqueio
sudo nano /var/www/html/bloqueado.html
<!DOCTYPE html>
<html>
<head>
    <title>Bloqueio de Acesso</title>
</head>
<body>
    <h1>Grupo 316</h1>
    <p>Este site foi bloqueado pela política de acesso da empresa.</p>
</body>
</html>
sudo systemctl restart apache2
http://200.10.0.16/bloqueado.html

```
