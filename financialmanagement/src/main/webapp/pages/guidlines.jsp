<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report</title>
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
      <li class="nav-item">
        <a class="nav-link" href="home.jsp">Home</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="receipt.jsp">Receipt</a>
      </li>
       <li class="nav-item ">
        <a class="nav-link" href="usernotice.jsp">Notice</a>
      </li>
      <li class="nav-item  active">
        <a class="nav-link" href="#" >Guidelines</a>
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
`<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
	%>

<div class="guid" style="padding-left:30px;margin-top: 20px">
	<header style="text-align: center;"><h3><b>Bills & Payments</b></h3></header>
	<div>
	<h4 style="color:green">Water & Sewer</h4>
	<p>Your water and sewer usage are measured by a meter. Your water and sewer bill can either be billed to your individual apartment or to the apartment community. Apartment communities that are given the bill will split the total amount by the number of households on the property. Residents will then add the distributed amount to their next rent payment.<br>
According to Statistics, a family of four pays on average $70 a month for water, with each family member using approximately 100 gallons. Learn to conserve water by shrinking your usage at home!</p>
	</div>
	<div>
		<h4 style="color:green">Electricity</h4>
		<p>Just like water, an apartment dwellers electricity usage is measured using a meter. Heating and cooling units use more power than any other home appliance, including a water heater and washer or dryer. There are numerous ways to save on your energy bill. You can then use those savings to fund something special for your home, like a living room set
<br>
NPR reports that a house uses an average of 908 kilowatts each month. At a cost of $0.12 per kilowatt, the average electric bill will run $109. Your bill, of course, may be more or less dependent on the size of your apartment, the number of appliances (and their age), and if you have a roommate.</p>
	</div>
	<div>
		<h4 style="color:green">Trash</h4>
		<p>Your trash expense is generally included in your rent unless your apartment has valet waste services. You typically do not get to choose the provider. Trash pickup companies are contracted by the apartment community and residents pay a monthly fee.
<br>
Renters tend to pay between $25 and $35 a month for valet trash, according to Property Manager Insider. </p>
	</div>
	<div>
		<h4 style="color:green">Rent</h4>
		<p>This amount should stay the same each month for the duration of your rental contract unless you get a monthly rental agreement, which is not binding but also doesn't prevent rent increases. In addition, most rental agreements require at least one to two months of a security deposit, so be sure to account for that as well.</p>
	</div>
	<div>
		<h4 style="color:green">Maintance</h4>
		<p>Society maintenance charges rules have a direct bearing on the life cycle cost of a property. Expenses on repair and maintenance of the lift of the society, including charges for running the lift. Car parking charges. It may also include salaries of office staff, liftmen, watchmen, etc.,  </p>
	</div>
	<div>
		<h4 style="color:black"><b>Note</b></h4>
		<p><i>A fine of rupees 100 is collected for all delayed payment before 10th of each month.</i></p>
</div>






<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>