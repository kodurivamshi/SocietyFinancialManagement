<%@page import="com.app.services.ComplaintService"%>
<%@page import="com.app.models.ComplaintModel"%>
<%@ page isELIgnored="false" %>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Complaints page</title>
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
      <li class="nav-item   active">
        <a class="nav-link" href="#" >Complaints</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="action.jsp" >Actions</a>
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

<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
ArrayList<ComplaintModel>cm=new ArrayList<ComplaintModel>();
if(session.getAttribute("admin")==null)
	response.sendRedirect("login.jsp");
else if(!session.getAttribute("admin").equals("admin"))
	response.sendRedirect("login.jsp");
else{
	ComplaintService cs=new ComplaintService();
	session.removeAttribute("complaints");
session.setAttribute("complaints", cs.getComplaints());
	cm=(ArrayList<ComplaintModel>)session.getAttribute("complaints");
}
%>
<% ArrayList<ComplaintModel>cm1=cm; %>
<div style="display:flex;justify-content:  center;margin-top:100px">
	<div class="card" style="width:500px;">
  <div class="card-header text-center" >
   <h3><b>Complaint Box</b></h3>
  </div>
  <ul class="list-group list-group-flush" id="complaint">
  	<%for(int i=0;i<cm.size();i++){ %>
  		<li class="list-group-item">
  			<div style="display:flex;">
  			<div>
  				<div><h4><%=cm.get(i).getName() %></h4></div>
  				<div><i>Posted:&nbsp<%=cm.get(i).getDate() %></i></div>
  			</div>
  			<div style="display: flex;margin-left:100px">
  			<div><button data-toggle="modal" onclick="modal(<%=i %>)" data-target="#complaintmodal" class="btn btn-warning btn-sm ml-auto text-white"><b>View Complaint</b></button></div>
  			</div>
  			</div>
  		</li>
  	<%} %>
    <%--<li class="list-group-item">Cras justo odio</li>
    <li class="list-group-item">Dapibus ac facilisis in</li>
    <li class="list-group-item">Vestibulum at eros</li> --%>
  </ul>
</div>

</div>
 <div id="complaintmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title"><b><p style="color:red" id="username"></p></b></h4>         
          <button type="button" class="close" data-dismiss="modal">&times;</button>
                	
                </div><br>
                <div style="margin-left:15px">
               <b> Flat No: </b><p id="flat"></p>
                </div><div class="modal-body">
                	<div><b>issue:</b></div>
                	<div>
                		<textarea rows="10" cols="10" id="issue"></textarea>
                	</div>
                	<form action="complaint" >
                		 <input type="hidden" id="name" name="name">
                		 <p>
						      <label>
						        <input id="check" type="checkbox"  name="seen" onchange="solved()" value="yes"/>
						        <span><i>Issue solved?</i></span>
						      </label>
						 </p>
						  <div  class="input-field col s6" id="pay">
					          <input type="text" class="validate" name="amount"  required>
					          <label for="amount">Amount spent?</label>
					        </div>
					   
						 <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Done</button>        
                        </div>
               
                	</form>
                </div>
        </div>
    </div>
    </div>

<script>
	function modal(r){
		document.getElementById("check").checked=false;
		document.getElementById("pay").style.visibility="hidden";
		console.log(r);
		<%for(int i=0;i<cm1.size();i++){%>
			if(r==<%=i%>){
				document.getElementById("name").value="<%=cm1.get(i).getName()%>";
				document.getElementById("username").innerHTML="<%=cm1.get(i).getName()%>";
				document.getElementById("issue").innerHTML="<%=cm1.get(i).getComplaint()%>";
				document.getElementById("flat").innerHTML="<%=cm1.get(i).getFlat()%>";
			}
		<%}%>
	}
	function solved(){
		console.log("ss");
		if(document.getElementById("check").checked==true){
			document.getElementById("pay").style.visibility="visible";
		}
		else
			document.getElementById("pay").style.visibility="hidden";
	}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>