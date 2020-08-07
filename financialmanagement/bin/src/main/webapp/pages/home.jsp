<%@page import="com.app.models.BillModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 

<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<title>Home Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
	`<%
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
		String s=(String)session.getAttribute("uname");
		BillModel bm=(BillModel)session.getAttribute("bill");
	%>
	
 <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
 <div class="container-fluid">
  <a class="navbar-brand" href="#">Financial Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item active">
        <a class="nav-link" href="#">Home</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="receipt.jsp">Receipt</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Report.jsp" >Report</a>
      </li>
      
    </ul>
    <form action="LogoutServlet">
    <input type="submit" value="Logout" class="waves-effect btn">
    </form>
  </div>
  </div>
</nav>

<header class="jumbotron" >
<div class="container" style="color:white;background-color: purple;display:flex;align-content: center;">
<div class="row m-auto">
	<h1>welcome  <%=s %></h1>
	</div>
</div>
</header>
	
	
	
	<div class="container" style="display:flex;align-content: center">
		<div class="row m-auto" style="width:500px;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Yours Monthly payments</span><br><br>
		<table class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th scope="col">Details</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr scope="row"><td>Room Rent</td><td><%=bm.getRoomrent() %></td></tr>
      <tr scope="row"><td>Electricity Bill</td><td><%=bm.getElectricitybill() %></td></tr>
        <tr scope="row"><td>Water Bill</td><td><%=bm.getWaterbill() %></td></tr>
          <tr scope="row"><td>Trash Bill</td><td><%=bm.getTrashbill() %></td></tr>
            <tr scope="row"><td>Sewer Bill</td><td><%=bm.getSewerbill() %></td></tr>
              <tr scope="row"><td>Maintance Bill</td><td><%=bm.getMaintancebill() %></td></tr>
                <tr scope="row" class="bg-primary"><td>Fine</td><td><%=bm.getFine() %></td></tr>
                  <tr scope="row" class="bg-primary"><td>Total Pendings</td><td><%=bm.getTotalpending() %></td></tr>
                    <tr scope="row" class="bg-info"><td>Total Paid</td><td><%=bm.getTotalpaid() %></td></tr>
                      <tr scope="row" class="bg-info"><td>Bills Paid</td><td><span class="badge bg-danger" style="color:white"><%=bm.getPaid() %></span></td></tr>
                        <tr scope="row" class="bg-warning"><td>Date </td><td><%=bm.getDate() %></td></tr>
                          <tr scope="row"><td></td><td></td></tr>
  </tbody>
</table>
	</div>
	       </div>   
	   
	   
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
</body>
</html>