<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <title>contact</title>
    <!-- Required meta tags always come first -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    ">
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
      <li class="nav-item ">
        <a class="nav-link" href="guidlines.jsp" >Guidelines</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="userreport.jsp" >Report</a>
      </li>
      
       <li class="nav-item  active">
        <a class="nav-link" href="#" >Contact</a>
      </li>
       
    </ul>
    <form action="logout">
    <input type="submit" value="Logout" class="waves-effect btn">
    </form>
  </div>
</nav>

<%response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
if(session.getAttribute("uname")==null)
	response.sendRedirect("login.jsp");
 %>
   

    <div class="container">
        <div class="row">
           
            <div class="col-12" style="padding-top:30px">
               <h3>Contact Us</h3>
               <hr>
            </div>
        </div>

        <div class="row row-content">
           <div class="col-12">
              <h3>Location Information</h3>
           </div>
            <div class="col-12 col-sm-4 offset-sm-1">
                   <h5>Our Address</h5>
                    <address style="font-size: 100%">
		              121, Clear Water Bay Road<br>
		              Clear Water Bay, Kowloon<br>
		              HONG KONG<br>
		              <i class="fa fa-phone"></i>: +852 1234 5678<br>
		              <i class="fa fa-fax"></i>: +852 8765 4321<br>
		              <i class="fa fa-envelope"></i>:
                        <a href="mailto:confusion@food.net">abc@gmail.com</a>
		           </address>
            </div>
           
            <div class="col-12 col-sm-11 offset-sm-1">
                <div class="btn-group" role="group">
                    <a role="button" class="btn btn-primary"><i class="fa fa-phone"></i>Call</a>
                    <a role="button" class="btn btn-info"><i class="fa fa-skype"></i> Skype</a>
                    <a role="button" class="btn btn-success"><i class="fa fa-phone"></i> Email</a>
                </div>
            </div>
        </div>


<form class="col" action="complaint" method="post">
   <div class="row">
    <div class="col-6">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Complaint</span>
          
          <div class="row">
        <div class="input-field col s6" >
          <input style="color: white;" id="name" type="text" class="validate" name="name" required>
          <label for="name">Name</label>
        </div>
      </div>
          <div class="row">
        <div class="input-field col s6">
          <input  style="color: white;" id="flat" type="text" name="flat" class="validate" required>
          <label for="flat">Flat No.</label>
        </div>
      </div>
      
      <div class="row">
        <div class="input-field col s6">
          <textarea style="color: white;"  id="complaint" type="text" class="validate" name="complaint" required></textarea>
          <label for="complaint">Complaint</label>
        </div>
      </div>
      
        <div class="card-action">
          <button class="btn waves-effect waves-light bg-primary" type="submit" name="action" onclick="complaint();">Submit</button>
              
        </div>   
        
        
      </div>
    </div>
  </div>
</div>
  </form>

<script>
function complaint(){
	alert("complaint submitted");
}
</script>
           <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
    
</body>

</html>
    