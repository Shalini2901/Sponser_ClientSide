<%@page import="com.dao.SponserDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sponser Management</title>

<link rel="stylesheet" href="Views/bootstrap.min.css">
<script src="Components/jquery-3.2.1.min.js"></script>
<script src="Components/sponsers.js"></script>

</head>
<body>

<div class="container"><div class="row"><div class="col-6">
<h1>Sponser Web Service</h1>
<form id="formSponser" name="formSponser">

 Sponser ID:
 <input id="sponserID" name="sponserID" type="text"
 class="form-control form-control-sm">
 
 <br> Product ID:
 <input id="productId" name="productId" type="text"
 class="form-control form-control-sm">
 
 <br> First Name:
 <input id="firstName" name="firstName" type="text"
 class="form-control form-control-sm">
 
 <br> Last Name:
 <input id="lastName" name="lastName" type="text"
 class="form-control form-control-sm">
 
 <br> Amount:
 <input id="sAmount" name="sAmount" type="text"
 class="form-control form-control-sm">
 
 <br> Company Name:
 <input id="compName" name="compName" type="text"
 class="form-control form-control-sm">
 <br>
 
 <input id="btnSave" name="btnSave" type="button" value="Save"
 class="btn btn-primary">
 <input type="hidden" id="hidItemIDSave"name="hidItemIDSave" value="">
</form>

<div id="alertSuccess" class="alert alert-success"></div>
<div id="alertError" class="alert alert-danger"></div>
<br>
<div id="divSponsersGrid">
 <%
 SponserDAOImpl sponserDaoObject = new SponserDAOImpl();
 out.print(sponserDaoObject.sponserList());
 %>
</div>
</div> </div> </div>

</body>
</html>