package vanessa.cezar.projetopessoa.dao;

import vanessa.cezar.projetopessoa.db.Db;
import vanessa.cezar.projetopessoa.model.Pessoa;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
public class PessoaDAO {
    public void inserir(Pessoa p) throws SQLException {
        final String sql = "INSERT INTO pessoa (nome, sexo, idioma) VALUES (?, ?, ?)";
        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, p.getNome());
            ps.setString(2, p.getSexo());
            ps.setString(3, p.getIdioma());
            ps.executeUpdate();
            try (ResultSet rs = ps.getGeneratedKeys()) {
                if (rs.next()) p.setId(rs.getInt(1));
            }
        }
    }

    public void atualizar(Pessoa p) throws SQLException {
        if (p.getId() == null) throw new SQLException("ID nulo para atualizar.");
        final String sql = "UPDATE pessoa SET nome=?, sexo=?, idioma=? WHERE id=?";
        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, p.getNome());
            ps.setString(2, p.getSexo());
            ps.setString(3, p.getIdioma());
            ps.setInt(4, p.getId());
            ps.executeUpdate();
        }
    }

    public void excluir(int id) throws SQLException {
        final String sql = "DELETE FROM pessoa WHERE id=?";
        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    public Pessoa buscarPorId(int id) throws SQLException {
        final String sql = "SELECT id, nome, sexo, idioma FROM pessoa WHERE id=?";
        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return map(rs);
            }
        }
        return null;
    }

    public List<Pessoa> listar() throws SQLException {
        final String sql = "SELECT id, nome, sexo, idioma FROM pessoa ORDER BY id DESC";
        List<Pessoa> lista = new ArrayList<>();
        try (Connection conn = Db.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) lista.add(map(rs));
        }
        return lista;
    }

    private Pessoa map(ResultSet rs) throws SQLException {
        return new Pessoa(
                rs.getInt("id"),
                rs.getString("nome"),
                rs.getString("sexo"),
                rs.getString("idioma")
        );
    }
}
