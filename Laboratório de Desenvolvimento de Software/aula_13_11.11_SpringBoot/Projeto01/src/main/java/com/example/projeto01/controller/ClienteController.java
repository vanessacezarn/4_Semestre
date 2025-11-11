package com.example.projeto01.controller;

import com.example.projeto01.model.Cliente;
import com.example.projeto01.repository.ClienteRepository;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/clientes")
public class        ClienteController {
    private final ClienteRepository clienteRepository;

    public ClienteController(ClienteRepository clienteRepository) {
        super();
        this.clienteRepository = clienteRepository;
    }

    @GetMapping
    public List<Cliente> listar() {
        return clienteRepository.findAll();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Cliente adicionar(@RequestBody Cliente cliente) {
        return clienteRepository.save(cliente);
    }

    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Cliente> deletarCliente(@PathVariable Long id) {
        if (!clienteRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        //remove o cliente
        clienteRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    @PutMapping("/{id}")
    public ResponseEntity<Cliente> atualizarClientes(@PathVariable Long id, @RequestBody Cliente clienteAtualizado) {
        if (!clienteRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Cliente clienteExistente = clienteRepository.findById(id).orElse(null);

        if (clienteExistente != null) {
            clienteExistente.setNome(clienteAtualizado.getNome());

            Cliente clienteAtualizadoNoBanco = clienteRepository.save(clienteExistente);
            return ResponseEntity.ok(clienteAtualizadoNoBanco);
        }else{
            return ResponseEntity.notFound().build();
        }
    }

}//fim das chaves da classe


