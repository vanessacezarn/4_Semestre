package com.example.projeto01;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/clientes")
public class ClienteController {
    private final ClienteRepository clienteRepository;
    public ClienteController(ClienteRepository clienteRepository) {
        super();
        this.clienteRepository = clienteRepository;
    }

    @GetMapping
    public List<Cliente> listar(){
        return clienteRepository.findAll();
    }
}
