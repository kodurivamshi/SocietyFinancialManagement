<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Actions page</title>
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
        <a class="nav-link" href="rents.jsp">Rents</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="tenants.jsp">Tenants</a>
      </li>
      <li class="nav-item ">
        <a class="nav-link" href="notice.jsp">Notice</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="complaints.jsp" >Complaints</a>
      </li>
       <li class="nav-item  active">
        <a class="nav-link" href="#" >Actions</a>
      </li>
         <li class="nav-item">
        <a class="nav-link" href="report.jsp" >Report</a>
      </li>
    </ul>
    <form action="logout">
    <input type="submit" value="Logout" class="waves-effect btn">
    </form>
  </div>
</nav>

`<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		if(session.getAttribute("admin")==null)
			response.sendRedirect("login.jsp");
		else if(!session.getAttribute("admin").equals("admin"))
			response.sendRedirect("login.jsp");
		else{
		}
%>
<div style="display: flex; flex-direction: column;">
	<div style="text-align: center;"><b>Update the</b> </div>
	<div style="display: flex;justify-content: center;align-content: center;margin-top: 10px;">
		<div><button type="button" data-toggle="modal" data-target="#liftmodal"  class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Lift Bill</button>
                            </div>
		<div style="margin-left:15px"><button type="button" data-toggle="modal" data-target="#securitymodal" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Security Fee</button>
                            </div>
		<div style="margin-left:15px"><button type="button" data-toggle="modal" data-target="#cleanermodal" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cleaner Fee</button>
                            </div>
	</div>
</div>

<div style="margin-top:50px;margin-left: 50px;width: 400px;text-align: center;border:solid black 2px">
	<div><span class="badge bg-danger text-white">Crete a Notice</span></div>
	<div style="padding:20px">
	<fieldset>
		<form action="createnotice" method="post">
				<div class="row">
					        <div class="input-field col">
					          <input id="heading" type="text" name="heading" class="validate">
					          <label for="heading">Heading of the Notice</label>
					        </div>
				 </div>
				<div class="row">
					        <div class="input-field col">
					          <textarea rows="20" cols="20" name="subject"></textarea>
					          <label for="subject">Body of Notice</label>
					        </div>
				 </div>
				                 <button type="submit" class="btn btn-primary btn-bg ml-1"><b>Post</b></button>        
		</form>
	</fieldset>
	</div>
</div>
<div id="liftmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Lift Bill Updating</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="updatefees" method="post">
      					<div class="row">
					        <div class="input-field col s12">
					          <input id="lift" type="text" name="lift" class="validate">
					          <label for="lift">Lift Bill</label>
					        </div>
					      </div>
      				<div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Update</button>        
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
<div id="securitymodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Security Fee Updating</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="updatefees" method="post">
      					<div class="input-field col s12">
					          <input id="security" type="text" name="security" class="validate">
					          <label for="security">Security Fee</label>
					        </div>
					      </div>
      				<div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Update</button>        
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
<div id="cleanermodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Cleaner Fee Updating</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="updatefees" method="post">
      					<div class="input-field col s12">
					          <input id="cleaner" type="text" name="cleaner" class="validate">
					          <label for="cleaner">Cleaner Fee</label>
					        </div>
      				<div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Update</button>        
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>