package dao;

import model.Usuario;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.mysql.jdbc.Driver;


public class UsuarioDAO {
   
    public static UsuarioDAO getEquipamento() {
        Object UsuarioDAO = null;
       
        
        //if (UsuarioDAO== null) {
          //  Usuario Usuario = new Usuario();
        //}

        return (UsuarioDAO) UsuarioDAO;
    }

   
    public boolean cadastrarUsuario(Usuario e) throws Exception {
        Connection con = (Connection) Conexao.getConexao();
        String sql = "insert into usuario values(0,?,?,?,?,?)";
        PreparedStatement stm = (PreparedStatement) con.prepareStatement(sql);
        stm.setString(1, e.getNome());
        stm.setString(2, e.getSobrenome());
        stm.setString(3, e.getEndereco());
        stm.setString(4, e.getNascimento());
        stm.setString(5, e.getTelefone());

        
        
        if (stm.executeUpdate() == 1) {
            return true;
        } else {
            return false;
        }
    }

    public List<Usuario> listarUsuario() throws Exception {
        List<Usuario> usuario = new ArrayList<>();
        Connection con = (Connection) Conexao.getConexao();
        String sql = "select * from usuario";
        PreparedStatement stm = (PreparedStatement) con.prepareStatement(sql);
        ResultSet rs = stm.executeQuery();

        while (rs.next()) {
        	Usuario e = new Usuario();
            e.setId(rs.getInt("id"));
            e.setNome(rs.getString("nome"));
            e.setSobrenome(rs.getString("sobrenome"));
            e.setTelefone(rs.getString("telefone"));
            e.setNascimento(rs.getString("nascimento"));
            e.setEndereco(rs.getString("endereco"));
            usuario.add(e);

        }
        
        return usuario;
    }

    public boolean excluirUsuario(int codigo) throws Exception {
        Connection con = (Connection) Conexao.getConexao();
        String sql = "delete from usuario where id = ?";
        PreparedStatement stm = (PreparedStatement) con.prepareStatement(sql);
        stm.setInt(1, codigo);

        if (stm.executeUpdate() == 1) {
            return true;
        } else {
            return false;
        }

    
    }
    
    public boolean editarUsuario (Usuario p) throws Exception {
        Connection con = (Connection) Conexao.getConexao();
        String sql = "update usuario set nome=?, sobrenome=?, telefone=?, nascimento=?, endereco=?  where id=?";
        java.sql.PreparedStatement stm = (java.sql.PreparedStatement) con.prepareStatement(sql);
        stm.setString(1, p.getNome());
        stm.setString(2, p.getSobrenome());
        stm.setString(3, p.getTelefone());
        stm.setString(4, p.getNascimento());
        stm.setString(5, p.getEndereco());
        stm.setInt(6, p.getId());
        

        if (stm.executeUpdate() != 1) {
            return false;
        } else {
            return true;
        }

    }

}
               
    
   