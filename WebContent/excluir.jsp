<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Excluir usuário</title>
	</head>
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/estilo.css">
<body>

<%
	int id = Integer.parseInt(request.getParameter("id"));
	UsuarioDAO d = new UsuarioDAO();
	
	if(d.excluirUsuario(id)){
	%>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h5 class="modal-title" id="exampleModalLabel">Exclusão de usuário</h5>
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          <span aria-hidden="true">&times;</span>
	        </button>
	      </div>
	      <div class="modal-body">
	        <p>Usuário excluido com sucesso.</p>
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
		        <h5 class="modal-title" id="exampleModalLabel">Exclusão de usuário</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <p>Não foi possível excluir o usuário, tente mais tarde.</p>
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
	

	
	


%>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
	
	<script>
		$(document).ready(function(){ $('#exampleModal').modal('show'); });
	</script>
</body>
</html>