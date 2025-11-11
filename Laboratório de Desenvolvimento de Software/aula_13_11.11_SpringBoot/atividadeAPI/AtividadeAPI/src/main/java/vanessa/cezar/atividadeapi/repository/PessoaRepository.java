package vanessa.cezar.atividadeapi.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import vanessa.cezar.atividadeapi.model.Pessoa;
import org.springframework.stereotype.Repository;

@Repository
public interface PessoaRepository extends JpaRepository<Pessoa, Long> {

    boolean existsPessoaByIdioma(String idioma);
    Pessoa findByIdioma(String idioma);
}
