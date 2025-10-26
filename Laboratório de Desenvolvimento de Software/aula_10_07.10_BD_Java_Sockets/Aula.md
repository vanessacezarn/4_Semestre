# SOCKETS
- são uma abstração que permite a comunicação entre processos em diferentes dispositivos através de uma rede
- fornece uma maneira de estabelecer conexões e enviar dados entre computadores, permitindo a construção de aplicações distribuidas
- em java ➔ a API Socket faz parte do pacote java.net e é usada para criar aplicações cliente-servidor robusta e escaláveis
- existe dois tipos principais de socket em java:
### Socket Client (Socket)
- usado pelo lado que inicia a comunicação
- se conecta a um servidor esperando por conexões em um endereço específico e porta
- não tem acesso/conexão com o banco de dados
### Socket Servidor (ServerSocket)
- espera por conexões de clientes
- quando o cliente se conecta, o servidor cria um novo socket dedicado para lidar com essa conexão
- é quem consulta no banco de dados

## SERVIDOR 
- é implementado sem interface gráfica
### Classe JavaBD que representa o servidor
```java

import DAO.PessoaDAO;
import beans.Pessoa;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ServerSocket;
import java.net.Socket;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * será o servidor --> ele fica parado esperando para responder ao cliente
 * pesquisar sobre porta de redes
 */
public class JavaBD {
    public static void main(String[] args) {
        int porta = 12345; // use uma constate para a porta (que esteja vazia)
        try(ServerSocket servidorSocket = new ServerSocket(porta)){
            System.out.println("Servidor aguardando conexão de porta");
            while(true){
                try{
                    Socket clienteSocket = servidorSocket.accept();
                    System.out.println("Conexão aceita de "+clienteSocket.getInetAddress());
                    ObjectOutputStream out = new ObjectOutputStream(clienteSocket.getOutputStream());
                    ObjectInputStream in = new ObjectInputStream(clienteSocket.getInputStream());
                    int id = in.readInt();
                    System.out.println("ID recebido: "+id);
                    
                    // simulando a obtenção de uma Pessoa a partir do ID
                    PessoaDAO  pdao = new PessoaDAO();
                    Pessoa p = pdao.getPessoa(id);
                    out.writeObject(p);
                }catch(IOException ex){
                    System.out.println("Erro ao aceitar conexão do cliente");
                }
            }
        }catch(IOException e){
            System.out.println("Erro ao criar o servidorSocket");
        }
    }
}

```
## CLIENTE
## Criar um novo projeto CLientePessoaVeiculo
- no cliente é preciso ter a classe Pessoa, para ele ter conhecimento da estrutura 
- em um pacote beans ➔ copiar a classe Pessoa do projeto BDaula01 (**tem que serem iguais**) ➔ ajustar para a classe passe a ser serializável **em ambos os projetos**
- 
```java
/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package beans;

import java.io.Serializable;
import java.util.Objects;

/**
 *
 * @author thiag
 */
public class Pessoa implements Serializable {
    private int id;
    private String nome;
    private String sexo;
    private String idioma;

   

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Pessoa other = (Pessoa) obj;
        if (this.id != other.id) {
            return false;
        }
        if (!Objects.equals(this.nome, other.nome)) {
            return false;
        }
        if (!Objects.equals(this.sexo, other.sexo)) {
            return false;
        }
        return Objects.equals(this.idioma, other.idioma);
    }

    
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }
    
    @Override
    public String toString(){
        return this.id+"-"+this.nome;
    }
}

``` 
## INTERFACE PARA CONSULTAR PESSOA
<div align="center">
  <img width="425" height="305" alt="image" src="https://github.com/user-attachments/assets/0d4a600c-2b80-40af-b502-dc640f979609" />
</div>

### BOTÃO CONSULTAR
- tem que estar rodando o servidor(classe javaBD do projeto bdaula01)
```java
private void btn_consultarActionPerformed(java.awt.event.ActionEvent evt) {                                              
        try{
            String host = "localhost";
            int porta = 1234;
            
            Socket clienteSocket = new Socket(host,porta);
            System.out.println("Conexão efetuada com sucesso");
            
            ObjectOutputStream out = new ObjectOutputStream(clienteSocket.getOutputStream());
            ObjectInputStream in = new ObjectInputStream(clienteSocket.getInputStream());
            int id = Integer.parseInt(txtIDPessoa.getText());
            out.writeInt(id);
            out.flush();
            Pessoa p = (Pessoa) in.readObject();
            System.out.println("Resposta: "+p.getNome());
            txt_nome.setText(p.getNome());
            txt_sexo.setText(p.getSexo());
            txt_idioma.setText(p.getIdioma());
            out.close();
            in.close();
            clienteSocket.close();
        }catch(IOException ex){
            System.out.println("Erro na comunicação com o servidor");
        }catch(ClassNotFoundException ex){
            System.out.println("Classe Pessoa não encontrada");
        }
    }  
```
para conectar mais de um cliente ao servidor é preciso utilizar threads

# THREADS
- é uma unidade de execução leve que permite que um programa execute tarefas concorrentemente
- é uma forma de tornar uma aplicação capaz de realizar múltiplas operações simultaneamente, aumentando assim a eficiência e melhorando a capacidade de respota
- dois tipos de threads em java:
### THREAD PRINCIPAL ou main
- é iniciada quando um programa é executado
- é responsável por iniciar outras threads e pode executar operações simultaneamente com essas threads secundárias
  
### THREAD SECUNDÁRIA
- são criadas para executar tarefas específicas em paralelos com a thread principal
- são úteis para realizar operações que não bloqueiam a execução do programa principal

- é possível criar threads de duas maneiras principais: implementando a interface Runnable ou estendendo a classe Thread
- amabas as abordagens permite que você execute código de forna concorrente, mas há diferenças na flexibilidade e no design entre elas

## CRIANDO UM NOVO PROJETO THREADS











