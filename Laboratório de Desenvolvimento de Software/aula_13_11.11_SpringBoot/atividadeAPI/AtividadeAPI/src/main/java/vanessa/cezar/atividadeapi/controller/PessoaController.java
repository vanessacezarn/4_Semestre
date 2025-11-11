package vanessa.cezar.atividadeapi.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import vanessa.cezar.atividadeapi.model.Pessoa;
import vanessa.cezar.atividadeapi.repository.PessoaRepository;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/pessoa")
public class PessoaController {
    private final PessoaRepository pessoaRepository;

    public PessoaController(PessoaRepository pessoaRepository) {
        super();
        this.pessoaRepository = pessoaRepository;
    }

    @GetMapping
    public List<Pessoa> listar() {
        return pessoaRepository.findAll();
    }
    @GetMapping("/{id}")
    public ResponseEntity<Pessoa> buscar(@PathVariable long id) {
        if (!pessoaRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Pessoa pessoaEncontrada = pessoaRepository.findById(id).orElse(null);
        if (pessoaEncontrada != null) {
            return ResponseEntity.ok(pessoaEncontrada);
        }else{
            return ResponseEntity.notFound().build();
        }
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Pessoa adicionar(@RequestBody Pessoa pessoa) {
        return pessoaRepository.save(pessoa);
    }
    @DeleteMapping("/excluir/{id}")
    public ResponseEntity<Pessoa> deletarPessoa(@PathVariable long id) {
        if (!pessoaRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        pessoaRepository.deleteById(id);
        return ResponseEntity.noContent().build();
    }
    @PutMapping("/{id}")
    public ResponseEntity<Pessoa>atualizarPessoa(@PathVariable long id, @RequestBody Pessoa pessoaAtualizada) {
        if (!pessoaRepository.existsById(id)) {
            return ResponseEntity.notFound().build();
        }
        Pessoa pessoaEncontrada = pessoaRepository.findById(id).orElse(null);
        if (pessoaEncontrada != null) {
            pessoaEncontrada.setNome(pessoaAtualizada.getNome());
            pessoaEncontrada.setSexo(pessoaAtualizada.getSexo());
            pessoaEncontrada.setIdioma(pessoaAtualizada.getIdioma());
            Pessoa pessoaAtualizadanoBanco = pessoaRepository.save(pessoaEncontrada);
            return ResponseEntity.ok(pessoaAtualizadanoBanco);
        }else{
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping("/idioma/{idioma}")
    public ResponseEntity<Pessoa> buscarIdioma(@PathVariable String idioma) {
        if (!pessoaRepository.existsPessoaByIdioma(idioma)){
            return ResponseEntity.notFound().build();
        }
        Pessoa pessoa = pessoaRepository.findByIdioma(idioma);
        if (pessoa != null) {
            return ResponseEntity.ok(pessoa);
        }else{
            return ResponseEntity.notFound().build();
        }
    }


}//chave final da classe
