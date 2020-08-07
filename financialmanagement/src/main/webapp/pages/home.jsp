<%@page import="org.apache.jasper.JasperException"%>
<%@page import="com.app.models.BillModel"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Grand+Hotel&display=swap" rel="stylesheet">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#" style="font-family: Grand Hotel, cursive;font-size:30px"><b>Financial Management</b></a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item  active">
        <a class="nav-link"  href="#">Home</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="receipt.jsp" >Receipt</a>
      </li>
       <li class="nav-item ">
        <a class="nav-link" href="usernotice.jsp" >Notice</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="guidlines.jsp" >Guidelines</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userreport.jsp" >Report</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="contact.jsp" >Contact</a>
      </li>
    </ul>
    <form action="logout">
    <input type="submit" value="Logout" class="waves-effect btn">
    </form>
  </div>
</nav>
 
 `<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		System.out.println("hi...");
		String s=null;
		BillModel bm=new BillModel("",0,0,0,0,0,0,0,0,0,"",null);
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
		else{
		s=(String)session.getAttribute("uname");
		bm=(BillModel)session.getAttribute("bill");
		}
	%>
	
 <div class="fluid-container">
 
<header class="jumbotron" >
<div class="container" style="color:white;background-color: purple;display:flex;align-content: center;">
<div class="row m-auto">
	<h1>welcome  <%=s %></h1>
	</div>
	
</div>
</header>
	
	
	<div class="row">
	<div class="container" style="display:flex;align-content: center">
		<div class="row m-auto" style="width:500px;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Yours Monthly payments</span><br><br>
		<table class="table table-hover table-primary" id="rents">
  <thead>
    <tr class="table-secondary">
      <th scope="col">Details</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
 
    <tr><td>Room Rent</td><td><%=bm.getRoomrent() %></td></tr>
      <tr><td>Electricity Bill</td><td><%=bm.getElectricitybill() %></td></tr>
        <tr><td>Water Bill</td><td><%=bm.getWaterbill() %></td></tr>
          <tr><td>Trash Bill</td><td><%=bm.getTrashbill() %></td></tr>
            <tr><td>Sewer Bill</td><td><%=bm.getSewerbill() %></td></tr>
              <tr><td>Maintance Bill</td><td><%=bm.getMaintancebill() %></td></tr>
                <tr class="bg-primary"><td>Fine</td><td><%=bm.getFine() %></td></tr>
                  <tr class="bg-primary"><td>Total Pendings</td><td><%=bm.getTotalpending() %></td></tr>
                    <tr class="bg-info"><td>Total Paid</td><td><%=bm.getTotalpaid() %></td></tr>
                      <tr class="bg-info"><td>Bills Paid</td><td><span class="badge bg-danger" style="color:white"><%=bm.getPaid() %></span></td></tr>
                        <tr class="bg-warning"><td>Date </td><td><%=bm.getDate() %></td></tr>
                     
  </tbody>
</table>
	</div>
	       </div>   
	   
	  </div>
</div>
<script>
var table=document.getElementById("rents");
var row=document.getElementById("rents").rows.length;

for(var x=1;x<=6;x++){
	for(var y=1;y<=1;y++){
		if(table.rows[x].cells[y].innerHTML==0)
			table.rows[x].cells[y].style.backgroundColor="#ccff90";
		else{
			table.rows[x].cells[y].style.backgroundColor="#ffcdd2";
		}
	}
}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
</body>
</html>