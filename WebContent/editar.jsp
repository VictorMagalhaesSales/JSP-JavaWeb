<%@page import="dao.UsuarioDAO"%>
<%@page import="dao.Conexao"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta chatset="UTF-8">
		<title>Editar usuário</title>
		<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/estilo.css">
	</head>
	<body>
		<%
			int id= 0;
			String nome = "";
			String sobrenome = "";
			String endereco = "";
			String nascimneto = "";
			String telefone = "";
			
		if(request.getParameter("id") != null){
			id = Integer.parseInt(request.getParameter("id"));
			nome = request.getParameter("nome");
			sobrenome = request.getParameter("sobrenome");
			endereco = request.getParameter("endereco");
			nascimneto = request.getParameter("nascimento");
			telefone = request.getParameter("telefone");
		}
		%>
		<aside>
			<center><img src="img/crud.png" width="200" class="img"></center>
			<div class="laranja">
				<div class="nav flex-column nav-pills" aria-orientation="vertical">
			      <a class="nav-link sis js-scroll-trigger waves-effect" href="index.jsp">Voltar</a>
			    </div>
			</div>
		</aside>
		<div class="corpo">
			<div class="cadastrar" style="padding-bottom">
				<h4 class="" id="cadastrar"><b>Editar usuário <%= nome+" "+sobrenome %></b></h4>

				<form class="form col-md-10 offset-md-1" action="editresult.jsp" method="get">
				
					<input type="text" name="id2" value=<%= id %> style="display:none;">
					<div class="row ">
						<div class="col-md-5">
							<label for="nome2">Nome: </label>
							<input type="text" name="nome2" id="nome2" class="form-control" placeholder="Seu primeiro nome" required value=<%= nome %>>
						</div>
						<div class="col-md-6 offset-md-1">
							<label for="sobrenome2">Sobrenome: </label>
							<input type="text" name="sobrenome2" id="sobrenome2" class="form-control" placeholder="Seu sobrenome" required value=<%= sobrenome %>>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<label for="endereco2">Endereco: </label>
							<input type="text" name="endereco2" id="endereco2" class="form-control" placeholder="Seu endereço" required value=<%= endereco %>>
						</div>
					</div>
					<div class="row">
						<div class="col-md-5">
							<label for="nascimento2">Data de nascimento: </label>
							<input type="date" name="nascimento2" id="nascimento2" class="form-control" required value=<%= nascimneto %>>
						</div>
						<div class="col-md-6 offset-md-1">
							<label for="telefone2">Telefone: </label>
							<input type="text" name="telefone2" id="telefone2" class="form-control" placeholder="Telefone" required value=<%= telefone %>>
						</div>
					</div>
					<br>
					<button type="submit" class="btn btn-primary col-md-12" style="border-radius: 0px 20px 0px 20px; font-weight: bold;"> <img src="img/edit.png" width="25px"></button>
				</form>
			</div>
		</div>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){ $('#exampleModal').modal('show'); });
	</script>
	</body>
</html>