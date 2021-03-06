<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="beans.*"  %>
        <%@ page import="java.util.ArrayList"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
    <%@include file="bootstrap/css/bootstrap.css" %>
    <%@include file="bootstrap/css/bootstrap-theme.css" %>    
</style>
<script type="text/javascript">
<%@include file="js/jquery-3.2.1.min.js"%>
<%@include file="js/test.js"%>

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
</head>
<body style="padding-top: 70px;">
<%@ include file="header.jsp"%>
<div class="container">
<div class="row">
<div class="col-md-12">

<div class="col-md-4" style="background-color: #e8e8e8;border-radius: 10px;">
<h3> Rechercher un jeu</h3>
<form>
<table style="border-collapse: separate;border-spacing:0 5px;">
<tr>
<th>Titre</th>
<td><input type="text" name="title" class="form-control"/></td>
</tr>
<tr>
<th>Plateforme</th>
<td>
<select name="plateforme" class="form-control">
<%= request.getAttribute("plateformes") %> %>
</select>
</td>
</tr>
<tr>
<th>Annee</th>
<td><input type="text" name="year" class="form-control"/></td>
</tr>
<tr>
<th>Editeur</th>
<td>
<select name="editeur" class="form-control">
<%= request.getAttribute("editeurs") %> %>
</select>
</td>
</tr>
<tr>
<th>Prix Minimum</th>
<td><input type="text" name="minPrice" class="form-control"/></td>
</tr>
<tr>
<th>Prix Maximum</th>
<td><input type="text" name="maxPrice"/ class="form-control"></td>
</tr>
<tr>
</tr>
</table>

</form>
<button class="btn btn-lg btn-primary btn-block" id="searchGame">Rechercher</button>

</div>
<div class="col-md-8" id="TableView">
<h2>Liste des jeux</h2>
<table class="table">
<tr>
<th>Titre</th>
<th>Pegi</th>
<th>Note</th>
<th>Editeur</th>	
<th>Pays</th>
<th>Plateforme</th>
<th>Prix</th>
<% if(request.getSession().getAttribute("client") != null){ %>
<th> Action </th>
<%} %>
</tr> 
<% 
try{
Jeu[] liste = (Jeu[])request.getAttribute("liste"); 
}

catch(Exception e){
 System.out.print(e.toString());	
}
Jeu[] liste = (Jeu[])request.getAttribute("liste"); 
%>
<% int  i = 0; 
for (i=0; i<liste.length; i++){
	%><tr>
	<td>
	<%=
	liste[i].getTitle()
	%>
	</td>
	<td><%=  liste[i].getFk_pegi().getDescription()%></td>
	<td><%=  liste[i].getNote()%></td>
	<td><%=  liste[i].getFk_editeur().getDescription()%></td>
	<td><%=  liste[i].getFk_editeur().getCountry_fk().getNom()%></td>
	<td><%=  liste[i].getPlateforme().getName()%></td>
	<td><%=  liste[i].getPrix()%></td>
	<% if(request.getSession().getAttribute("client") != null){ %>
<td> <form action="PanierAction" method="post">
<input type="hidden" name="productId" value="<%= liste[i].getPlateforme_jeu_fk()%>">
<input type="submit" value="Ajouter" class="btn btn-success" id="AddPanier">
</form> </td>
<%} %>
</tr> 
						
			
			
	</tr>
<% } %>

</table></div>
</div>
</div>
</div>
</body>
</html>