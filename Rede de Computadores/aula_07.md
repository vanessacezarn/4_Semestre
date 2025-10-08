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
<img width="738" height="860" alt="image" src="https://github.com/user-attachments/assets/2ddec51c-9ed9-4afc-b4e2-f66dc3cd07e2" />

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

http_access deny sites_bloqueados

http_access allow minha_rede_local
http_access allow localhost

http_access deny all --antes do allow

http_port 3128
```
CTRL + O
Enter
CTRL + X

```
sudo systemctl restart squid -- reiniciar o squid
```

6) Bloquear o site bet365.bet.br por meio do proxy configurado

8) instalar um servidor de ssh
```
sudo apt install openssh-server -y
sudo systemctl enable ssh
sudo systemctl start ssh
sudo systemctl status ssh
```

10) criar um usuário e colocar ele no grupo do Sudo
```
sudo adduser nomeusuario
sudo usermod -aG sudo nomeusuario
```

```
sudo nano /etc/netplan/01-netcfg.yaml
```

12) Acessar o servidor por ssh com o usuário criado.
13) Configurar uma subinterface com o IP da LAN do grupo
14) Configurar a interface física com o endereço da WAN do grupo

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

---
### ajuda 
```
laboratorio@LAB24DT04:~$ sudo nano /etc/netplan/01-netcfg.yaml
laboratorio@LAB24DT04:~$ ls -l /etc/netplan/
total 4
-rw-r--r-- 1 root root 104 fev 20  2024 01-network-manager-all.yaml
laboratorio@LAB24DT04:~$ nmcli connectio show
NAME               UUID                                  TYPE      DEVICE    
Conexão cabeada 1  8f979374-517e-3d8a-aa26-86d56c73354f  ethernet  enp0s31f6 
laboratorio@LAB24DT04:~$  service squid status
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: active (running) since Wed 2025-10-08 10:19:07 -03; 28min ago
       Docs: man:squid(8)
   Main PID: 21045 (squid)
      Tasks: 4 (limit: 18722)
     Memory: 16.1M
        CPU: 298ms
     CGroup: /system.slice/squid.service
             ├─21045 /usr/sbin/squid --foreground -sYC
             ├─21047 "(squid-1)" --kid squid-1 --foreground -sYC
             ├─21048 "(logfile-daemon)" /var/log/squid/access.log
             └─21049 "(pinger)"

out 08 10:19:07 LAB24DT04 squid[21047]: Finished loading MIME types and icons.
out 08 10:19:07 LAB24DT04 squid[21047]: HTCP Disabled.
out 08 10:19:07 LAB24DT04 squid[21047]: Pinger socket opened on FD 15
out 08 10:19:07 LAB24DT04 squid[21047]: Squid plugin modules loaded: 0
out 08 10:19:07 LAB24DT04 squid[21047]: Adaptation support is off.
out 08 10:19:07 LAB24DT04 squid[21047]: Accepting HTTP Socket connections at co>
out 08 10:19:07 LAB24DT04 squid[21047]: Accepting HTTP Socket connections at co>
out 08 10:19:07 LAB24DT04 squid[21047]: ERROR: listen(..., 256) system call fai>
                                            listening port: 3128
laboratorio@LAB24DT04:~$ pwd
/home/laboratorio
laboratorio@LAB24DT04:~$ cd /etc/squid
laboratorio@LAB24DT04:/etc/squid$ ls -la
total 696
drwxr-xr-x   3 root root   4096 out  8 10:17 .
drwxr-xr-x 132 root root  12288 out  8 10:25 ..
drwxr-xr-x   2 root root   4096 out  8 08:57 conf.d
-rw-r--r--   1 root root   1800 out  3 10:35 errorpage.css
-rw-r--r--   1 root root 343143 out  8 10:17 squid.conf
-rw-r--r--   1 root root 342950 out  8 09:07 squid.conf.backup
laboratorio@LAB24DT04:/etc/squid$ sudo vi squid.conf
laboratorio@LAB24DT04:/etc/squid$ cat squid.conf
```

---

```
laboratorio@LAB24DT04:/etc/squid$ sudo nano squid.conf
laboratorio@LAB24DT04:/etc/squid$ ifconfig
Comando 'ifconfig' não encontrado, mas poder ser instalado com:
sudo apt install net-tools
laboratorio@LAB24DT04:/etc/squid$ sudo apt net-tools
E: Operação net-tools inválida
laboratorio@LAB24DT04:/etc/squid$ sudo apt install net-tools
Lendo listas de pacotes... Pronto
Construindo árvore de dependências... Pronto
Lendo informação de estado... Pronto        
Os NOVOS pacotes a seguir serão instalados:
  net-tools
0 pacotes atualizados, 1 pacotes novos instalados, 0 a serem removidos e 427 não atualizados.
É preciso baixar 204 kB de arquivos.
Depois desta operação, 819 kB adicionais de espaço em disco serão usados.
Obter:1 http://br.archive.ubuntu.com/ubuntu jammy-updates/main amd64 net-tools amd64 1.60+git20181103.0eebece-1ubuntu5.4 [204 kB]
Baixados 204 kB em 0s (765 kB/s)  
A seleccionar pacote anteriormente não seleccionado net-tools.
(Lendo banco de dados ... 216082 ficheiros e directórios actualmente instalados.
)
A preparar para desempacotar .../net-tools_1.60+git20181103.0eebece-1ubuntu5.4_a
md64.deb ...
A descompactar net-tools (1.60+git20181103.0eebece-1ubuntu5.4) ...
Configurando net-tools (1.60+git20181103.0eebece-1ubuntu5.4) ...
A processar 'triggers' para man-db (2.10.2-1) ...
laboratorio@LAB24DT04:/etc/squid$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.7  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:11:26  txqueuelen 1000  (Ethernet)
        RX packets 828224  bytes 1188153502 (1.1 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 179469  bytes 25751752 (25.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 5360  bytes 639354 (639.3 KB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 5360  bytes 639354 (639.3 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

laboratorio@LAB24DT04:/etc/squid$ pwd
/etc/squid
laboratorio@LAB24DT04:/etc/squid$ sudo nano squid.conf
laboratorio@LAB24DT04:/etc/squid$ sudo service squid stop
laboratorio@LAB24DT04:/etc/squid$ sudo service squid start
laboratorio@LAB24DT04:/etc/squid$ sudo service squid status
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: active (running) since Wed 2025-10-08 10:57:24 -03; 5s ago
       Docs: man:squid(8)
    Process: 22907 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, s>
   Main PID: 22910 (squid)
      Tasks: 4 (limit: 18722)
     Memory: 16.1M
        CPU: 82ms
     CGroup: /system.slice/squid.service
             ├─22910 /usr/sbin/squid --foreground -sYC
             ├─22912 "(squid-1)" --kid squid-1 --foreground -sYC
             ├─22913 "(logfile-daemon)" /var/log/squid/access.log
             └─22914 "(pinger)"

out 08 10:57:24 LAB24DT04 squid[22912]: Finished loading MIME types and icons.
out 08 10:57:24 LAB24DT04 squid[22912]: HTCP Disabled.
out 08 10:57:24 LAB24DT04 squid[22912]: Pinger socket opened on FD 15
out 08 10:57:24 LAB24DT04 squid[22912]: Squid plugin modules loaded: 0
out 08 10:57:24 LAB24DT04 squid[22912]: Adaptation support is off.
out 08 10:57:24 LAB24DT04 squid[22912]: Accepting HTTP Socket connections at co>
out 08 10:57:24 LAB24DT04 squid[22912]: Accepting HTTP Socket connections at co>
out 08 10:57:24 LAB24DT04 squid[22912]: ERROR: listen(..., 256) system call fai>
laboratorio@LAB24DT04:/etc/squid$ pwd
/etc/squid
laboratorio@LAB24DT04:/etc/squid$ ls -la
total 696
drwxr-xr-x   3 root root   4096 out  8 10:56 .
drwxr-xr-x 132 root root  12288 out  8 10:25 ..
drwxr-xr-x   2 root root   4096 out  8 08:57 conf.d
-rw-r--r--   1 root root   1800 out  3 10:35 errorpage.css
-rw-r--r--   1 root root 343179 out  8 10:56 squid.conf
-rw-r--r--   1 root root 342950 out  8 09:07 squid.conf.backup
laboratorio@LAB24DT04:/etc/squid$ sudo mv squid.conf old.squid.conf
laboratorio@LAB24DT04:/etc/squid$ ls -la
total 696
drwxr-xr-x   3 root root   4096 out  8 10:58 .
drwxr-xr-x 132 root root  12288 out  8 10:25 ..
drwxr-xr-x   2 root root   4096 out  8 08:57 conf.d
-rw-r--r--   1 root root   1800 out  3 10:35 errorpage.css
-rw-r--r--   1 root root 343179 out  8 10:56 old.squid.conf
-rw-r--r--   1 root root 342950 out  8 09:07 squid.conf.backup
laboratorio@LAB24DT04:/etc/squid$ sudo nano squid.conf
laboratorio@LAB24DT04:/etc/squid$ sudo service squid stop
laboratorio@LAB24DT04:/etc/squid$ sudo service squid start
laboratorio@LAB24DT04:/etc/squid$ sudo service squid status
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: active (running) since Wed 2025-10-08 11:03:57 -03; 6s ago
       Docs: man:squid(8)
    Process: 22964 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, s>
   Main PID: 22967 (squid)
      Tasks: 4 (limit: 18722)
     Memory: 16.2M
        CPU: 72ms
     CGroup: /system.slice/squid.service
             ├─22967 /usr/sbin/squid --foreground -sYC
             ├─22969 "(squid-1)" --kid squid-1 --foreground -sYC
             ├─22970 "(logfile-daemon)" /var/log/squid/access.log
             └─22971 "(pinger)"

out 08 11:03:57 LAB24DT04 squid[22969]: Using Least Load store dir selection
out 08 11:03:57 LAB24DT04 squid[22969]: Current Directory is /
out 08 11:03:57 LAB24DT04 squid[22969]: Finished loading MIME types and icons.
out 08 11:03:57 LAB24DT04 squid[22969]: HTCP Disabled.
out 08 11:03:57 LAB24DT04 squid[22969]: Pinger socket opened on FD 14
out 08 11:03:57 LAB24DT04 squid[22969]: Squid plugin modules loaded: 0
out 08 11:03:57 LAB24DT04 squid[22969]: Adaptation support is off.
out 08 11:03:57 LAB24DT04 squid[22969]: Accepting HTTP Socket connections at co>
laboratorio@LAB24DT04:/etc/squid$ sudo nano bloqueados.txt
laboratorio@LAB24DT04:/etc/squid$ sudo service squid stop
laboratorio@LAB24DT04:/etc/squid$ sudo service squid start
laboratorio@LAB24DT04:/etc/squid$ sudo service squid status
● squid.service - Squid Web Proxy Server
     Loaded: loaded (/lib/systemd/system/squid.service; enabled; vendor preset:>
     Active: active (running) since Wed 2025-10-08 11:06:24 -03; 2s ago
       Docs: man:squid(8)
    Process: 23004 ExecStartPre=/usr/sbin/squid --foreground -z (code=exited, s>
   Main PID: 23007 (squid)
      Tasks: 4 (limit: 18722)
     Memory: 16.0M
        CPU: 79ms
     CGroup: /system.slice/squid.service
             ├─23007 /usr/sbin/squid --foreground -sYC
             ├─23009 "(squid-1)" --kid squid-1 --foreground -sYC
             ├─23010 "(logfile-daemon)" /var/log/squid/access.log
             └─23011 "(pinger)"

out 08 11:06:24 LAB24DT04 squid[23009]: Using Least Load store dir selection
out 08 11:06:24 LAB24DT04 squid[23009]: Current Directory is /
out 08 11:06:24 LAB24DT04 squid[23009]: Finished loading MIME types and icons.
out 08 11:06:24 LAB24DT04 squid[23009]: HTCP Disabled.
out 08 11:06:24 LAB24DT04 squid[23009]: Pinger socket opened on FD 14
out 08 11:06:24 LAB24DT04 squid[23009]: Squid plugin modules loaded: 0
out 08 11:06:24 LAB24DT04 squid[23009]: Adaptation support is off.
out 08 11:06:24 LAB24DT04 squid[23009]: Accepting HTTP Socket connections at co>
laboratorio@LAB24DT04:/etc/squid$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.7  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:11:26  txqueuelen 1000  (Ethernet)
        RX packets 865825  bytes 1218374246 (1.2 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 216747  bytes 55766828 (55.7 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 6545  bytes 1501092 (1.5 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 6545  bytes 1501092 (1.5 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

laboratorio@LAB24DT04:/etc/squid$ ifconfig enp0s31f6:1 200.10.0.25 netmask 255.255.255.248 
SIOCSIFADDR: Operação não permitida
SIOCSIFFLAGS: Operação não permitida
SIOCSIFNETMASK: Operação não permitida
laboratorio@LAB24DT04:/etc/squid$ sudo ifconfig enp0s31f6:1 200.10.0.25 netmask 255.255.255.248 
laboratorio@LAB24DT04:/etc/squid$ ifconfig
enp0s31f6: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 10.104.16.7  netmask 255.255.255.192  broadcast 10.104.16.63
        ether d0:94:66:e8:11:26  txqueuelen 1000  (Ethernet)
        RX packets 890169  bytes 1247830369 (1.2 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 240549  bytes 85117934 (85.1 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0
        device interrupt 19  memory 0x70500000-70520000  

enp0s31f6:1: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 200.10.0.25  netmask 255.255.255.248  broadcast 200.10.0.31
        ether d0:94:66:e8:11:26  txqueuelen 1000  (Ethernet)
        device interrupt 19  memory 0x70500000-70520000  

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Loopback Local)
        RX packets 6624  bytes 1525846 (1.5 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 6624  bytes 1525846 (1.5 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

laboratorio@LAB24DT04:/etc/squid$ #     processing stops: For an "allow" rule, the corresponding
#       adaptation service is used for the transaction. For a "deny"
#       rule, no adaptation service is activated.
#
#       It is currently not possible to apply more than one adaptation
#       service at the same vectoring point to the same HTTP transaction.
#
#        See also: icap_service and ecap_service
#
#Example:
#adaptation_access service_1 allow all
#Default:
# Allow, unless rules exist in squid.conf.

#  TAG: adaptation_service_iteration_limit
#       Limits the number of iterations allowed when applying adaptation
#       services to a message. If your longest adaptation set or chain
#       may have more than 16 services, increase the limit beyond its
#       default value of 16. If detecting infinite iteration loops sooner
#       is critical, make the iteration limit match the actual number
#       of services in your longest adaptation set or chain.
#
#       Infinite adaptation loops are most likely with routing services.
#
#       See also: icap_service routing=1
#Default:
# adaptation_service_iteration_limit 16

#  TAG: adaptation_masterx_shared_names
#       For each master transaction (i.e., the HTTP request and response
#       sequence, including all related ICAP and eCAP exchanges), Squid
#       maintains a table of metadata. The table entries are (name, value)
#       pairs shared among eCAP and ICAP exchanges. The table is destroyed
#       with the master transaction.
#
#       This option specifies the table entry names that Squid must accept
#       from and forward to the adaptation transactions.
#
#       An ICAP REQMOD or RESPMOD transaction may set an entry in the
#       shared table by returning an ICAP header field with a name
^C      TX errors 0  dropped 0 overruns 0  carrier 0  collisions 00.0.313etmask 
laboratorio@LAB24DT04:/etc/squid$ ^C
laboratorio@LAB24DT04:/etc/squid$ 
```
