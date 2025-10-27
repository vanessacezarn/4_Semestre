/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Servidor;

import DAO.DisciplinasDAO;
import beans.Professores;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.Socket;

/**
 *
 * @author thiag
 */
public class ThreadServer extends Thread{
    private Socket clienteSocket;

    public ThreadServer(Socket clienteSocket) {
        this.clienteSocket = clienteSocket;
    }
    @Override
    public void run(){
        try{
            ObjectOutputStream out = new ObjectOutputStream(clienteSocket.getOutputStream());
            ObjectInputStream in = new ObjectInputStream(clienteSocket.getInputStream());
            int id = in.readInt();
            
            DisciplinasDAO ddao = new DisciplinasDAO();
            Professores p = ddao.getProfessorDisciplina(id);
            out.writeObject(p);
            
        }catch (IOException ex) {
            System.out.println("Erro ao lidar com o cliente");
        }
    }
    
}
