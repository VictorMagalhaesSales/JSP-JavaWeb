package dao;

import java.util.ArrayList;
import java.util.List;

import model.Usuario;


public class Exec {
    public static void main(String args[]) throws Exception{
        Usuario a = new Usuario();
        a.setEndereco("asa");
        a.setNome("as");
        a.setSobrenome("as");
        a.setNascimento("asaaaaaaa");
        a.setTelefone("as");
        
        UsuarioDAO d = new UsuarioDAO();
        List<Usuario> usuario = new ArrayList<>();
        usuario = d.listarUsuario();
        for(Usuario g: d.listarUsuario()) {
        	System.out.println(g.toString());
        }
        
        
//        List<Usuario> ee = new ArrayList<Usuario>();;
//        ee = d.listarUsuario();
//        for(Usuario pro: ee){
//            String a = pro.toString();
//            System.out.println(a);
//        }
        

    }
}
