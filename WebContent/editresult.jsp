<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.Conexao"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>Edição de usuário</title>
			<link rel="stylesheet" href="css/bootstrap.css">
			<link rel="stylesheet" href="css/estilo.css">
	</head>
	<body>
	
	<%	
	
	int id2 = Integer.parseInt(request.getParameter("id2"));
	String nome2 = request.getParameter("nome2");
	String sobrenome2 = request.getParameter("sobrenome2");
	String endereco2 = request.getParameter("endereco2");
	String nascimento2 = request.getParameter("nascimento2");
	String telefone2 = request.getParameter("telefone2");
	
	UsuarioDAO d = new UsuarioDAO();

	
	if( !(nome2 == null || sobrenome2 == null || endereco2 == null || nascimento2 == null || telefone2 == null) ){
		Usuario user = new Usuario();
		user.setId(id2);
		user.setNome(nome2);
		user.setSobrenome(sobrenome2);
		user.setEndereco(endereco2);
		user.setNascimento(nascimento2);
		user.setTelefone(telefone2);
		
		
		boolean cadastro = d.editarUsuario(user);
	
		if(cadastro){
		%>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Edição de usuário</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Usuário editado com sucesso.</p>
		      </div>
		      <div class="modal-footer">
		      	<form action="index.jsp">
		        	<button type="submit" class="btn btn-secondary">Fechar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<%
		}else{
		%>
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog" role="document">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="exampleModalLabel">Cadastro de usuário</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Não foi possível editar o usuário, tente mais tarde.</p>
		      </div>
		      <div class="modal-footer">
		      	<form action="index.jsp">
		        	<button type="submit" class="btn btn-secondary">Fechar</button>
		        </form>
		      </div>
		    </div>
		  </div>
		</div>
		<%	
		}
	}
	%>
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
		
		<script>
			$(document).ready(function(){ $('#exampleModal').modal('show'); });
		</script>
	</body>
</html>