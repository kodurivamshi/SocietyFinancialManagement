<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receipt</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">

</head>
<body>
`<%
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
	%>
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <a class="navbar-brand" href="#">Financial Management</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarTogglerDemo02" aria-controls="navbarTogglerDemo02" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarTogglerDemo02">
    <ul class="navbar-nav mr-auto mt-2 mt-lg-0">
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item  active">
        <a class="nav-link" href="#">Receipt</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="Report.jsp" >Report</a>
      </li>
      
    </ul>
    <form action="LogoutServlet">
    <input type="submit" value="Logout" class="waves-effect btn">
    </form>
  </div>
</nav>

<header>
	<div class="jumbotron">
	<div class="container" style="color:white;background-color: purple;display:flex;align-content: center;">
<div class="row m-auto">
	<h1>Your Monthly Bills</h1>
	</div>
</div>
	</div>
</header>


<form action="receipt">
<div class="row" style="margin:auto;margin-left:250px">
<div cass="col-4-md"><input type="text" placeholder="month(numbers)"></div>
<div cass="col-4-md"><input type="text" placeholder="year(numbers)"></div>
<input type="submit">
</div>
</form>
</body>
</html>