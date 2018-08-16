<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  pageEncoding="ISO-8859-1"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.Conexao"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
	<head>
		<meta chatset="UTF-8">
		<title>Projeto CRUD</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/estilo.css">
	</head>
	<body>
		<aside>
			<center><img src="img/crud.png" width="200" class="img"></center>
			<div class="laranja">
				<div class="nav flex-column nav-pills" aria-orientation="vertical">
			      <a class="nav-link sis js-scroll-trigger waves-effect" href="#visualizar"><img src="img/visu.png" width="25px"> Visualizar usuários</a>
			      <a class="nav-link sis js-scroll-trigger" href="#cadastrar"><img src="img/save.png" width="25px"> Cadastrar usuários</a>
			    </div>
			</div>
		</aside>
		<div class="corpo">

			<div class="visualizar">
				<div class="row">
					<h4 class="col-md-4" id="visualizar">Lista de usuários cadastrados</h4>

					<div class="input-group  offset-md-1 col-md-7">
						<input type="search" class="form-control" placeholder="Faça sua busca">
						<div class="input-group-prepend" >
							<div class="input-group-text" style="background-color: transparent; border: none;"><img src="img/busca.png" width="20"></div>
						</div>
					</div>
				</div>

				<br><br><br>
				<div class="over">
					<table class="table table-hover">
						<thead>
							<tr><th>ID</th><th>Nome</th><th>Sobrenome</th><th>Endereço</th><th>Nascimento</th><th>Telefone</th> <th>Ações</th></tr>
						</thead>
						<tbody>
							<% 
							UsuarioDAO d = new UsuarioDAO();
					        List<Usuario> usuario = new ArrayList<>();
					        usuario = d.listarUsuario();
					        for(Usuario g: d.listarUsuario()) {
					        %>
					        <tr> <td> <%= g.getId() %> </td> <td> <%= g.getNome() %> </td> <td> <%= g.getSobrenome() %> </td> <td> <%= g.getEndereco() %> </td> <td> <%= g.getNascimento() %> </td>  <td> <%= g.getTelefone() %> </td> 
					        <td>
					        <div class="f1">
						        <form action="editar.jsp" style="padding -10px;" method="get">
						        	<input type="text" value="<%= g.getId() %>" name="id" style="display: none;">
						        	<input type="text" value="<%= g.getNascimento() %>" name="nascimento" style="display: none;">
						        	<input type="text" value="<%= g.getNome() %>" name="nome" style="display: none;">
						        	<input type="text" value="<%= g.getSobrenome() %>" name="sobrenome" style="display: none;">
						        	<input type="text" value="<%= g.getTelefone() %>" name="telefone" style="display: none;">
						        	<input type="text" value="<%= g.getEndereco() %>" name="endereco" style="display: none;">
							        <button style="background-color: transparent; border: none;">
							        	<img src="img/editblack.png" width="25px">
							        </button>
						        </form>
					        </div>
					        <div class="f2">
						        <form action="excluir.jsp" method="post">
						        	<input type="text" value="<%= g.getId() %>" name="id" style="display: none;">
							        <button style="background-color: transparent; border: none;">
							        	<img src="img/excluirblack.png" width="25px">
							        </button>
						        </form>
					        </div>
					        </td> </tr>
					        <% } %>
						</tbody>
					</table>
				</div>
				<br>
			</div>

			<div class="cadastrar">
				<h4 class="" id="cadastrar">Cadastrar usuário</h4>

				<br><br>

				<form class="form col-md-10 offset-md-1" action="index.jsp" method="post">
					<div class="row ">
						<div class="col-md-5">
							<label for="nome">Nome: </label>
							<input type="text" name="nome" id="nome" class="form-control" placeholder="Seu primeiro nome" required>
						</div>
						<div class="col-md-6 offset-md-1">
							<label for="sobrenome">Sobrenome: </label>
							<input type="text" name="sobrenome" id="sobrenome" class="form-control" placeholder="Seu sobrenome" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="endereco">Endereco: </label>
							<input type="text" name="endereco" id="endereco" class="form-control" placeholder="Seu endereço" required>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5">
							<label for="nascimento">Data de nascimento: </label>
							<input type="date" name="nascimento" id="nascimento" class="form-control" required>
						</div>
						<div class="col-md-6 offset-md-1">
							<label for="telefone">Telefone: </label>
							<input type="text" name="telefone" id="telefone" class="form-control" placeholder="Telefone" required>
						</div>
					</div>
					<br>
					<button type="submit" class="btn btn-primary col-md-12" style="border-radius: 0px 20px 0px 20px; font-weight: bold;"> <img src="img/save.png" width="25px"></button>
				</form>
				<%	
					String nome = "";
					String sobrenome = "";
					String endereco = "";
					String nascimento = "";
					String telefone = "";

					nome = request.getParameter("nome");
					sobrenome = request.getParameter("sobrenome");
					endereco = request.getParameter("endereco");
					nascimento = request.getParameter("nascimento");
					telefone = request.getParameter("telefone");
					
					if( !(nome == null || sobrenome == null || endereco == null || nascimento == null || telefone == null) ){
						Usuario user = new Usuario();
						user.setNome(nome);
						user.setSobrenome(sobrenome);
						user.setEndereco(endereco);
						user.setNascimento(nascimento);
						user.setTelefone(telefone);
						
						
						boolean cadastro = d.cadastrarUsuario(user);
	
						if(cadastro){
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
						        <p>Usuário cadastrado com sucesso.</p>
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
						        <p>Não foi possível cadastrar o usuário, tente mais tarde.</p>
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
			</div>
		</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){ $('#exampleModal').modal('show'); });
	</script>
	</body>
</html>