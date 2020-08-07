
<%@ page isELIgnored="false" %><%@page import="com.app.models.BillModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rents</title>
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
        <a class="nav-link" href="#">Rents</a>
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

`<%
		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
		ArrayList<BillModel>bm=new ArrayList<BillModel>();
		if(session.getAttribute("admin")==null)
			response.sendRedirect("login.jsp");
		else if(!session.getAttribute("admin").equals("admin"))
			response.sendRedirect("login.jsp");
		else{
		bm=(ArrayList<BillModel>)session.getAttribute("rents");
		}
%>
<% ArrayList<BillModel>b=bm; %>


<div class="row">
	<div class="container">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Monthly Rents</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th scope="col">Name</th>
      <th scope="col">RommRent</th>
      <th scope="col">ElectricityBill</th>
      <th scope="col">WaterBill</th>
      <th scope="col">TrashBill</th>
      <th scope="col">SewerBill</th>
      <th scope="col">MaintanceBill</th>
      <th scope="col">Fine</th>
      <th scope="col">TotalPending</th>
      <th scope="col">TotalPaid</th>
      <th scope="col">Paid</th>
      <th scope="col">Date</th>
      <th scope="col">Add</th>
    </tr>
  </thead>
  <tbody>
		<% for(int i=0;i<bm.size();i++) {%>
			<tr >
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><b><%=bm.get(i).getName() %></b></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getRoomrent() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getElectricitybill() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getWaterbill() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getTrashbill() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getSewerbill() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getMaintancebill() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getFine() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="background-color:#00BFFF;border: 1px solid;text-align: center"><%=bm.get(i).getTotalpending() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="background-color:#00BFFF;border: 1px solid "><%=bm.get(i).getTotalpaid() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" style="text-align: center;"><%=bm.get(i).getPaid() %></td>
							<td data-toggle="modal" onclick="modal(<%=i %>)" data-target="#loginModal" class="bg-warning" style="text-align: center;"><%=bm.get(i).getDate() %></td>
							<td><button data-toggle="modal" data-target="#elecmodal" onclick="elec(<%=i %>)" type="button" class="btn btn-danger">ElectricityBill</button></td>
			</tr>
		<%} %>  		
    </tbody>
</table>
	</div>
	       </div> 
</div>  
<div id="elecmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Electricity Bill</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<form action="electricity" method="post">
                	<div class="row">
					        <div class="input-field col s6">
					          <input style="color:red" id="elecusername" type="text"  name="elecusername" class="validate" required>
					        </div>
					  </div>
                	<div class="row">
					        <div class="input-field col s6">
					          <input id="elecbill" type="text"  name="elecbill" class="validate" required>
					          <label for="elecbill">Electricity Bill</label>
					        </div>
					  </div>
                		 <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Add</button>        
                        </div>
                	</form>
                	
                </div>
        </div>
    </div>
    </div>
	
	<div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Rent Updating</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <form action="rents" method="post">
                    	  <div class="row">
						        <div class="input-field col s6">
						        	username
						          <input style="color:red;" id="user_name" type="text" name="name" class="validate">
						     </div>
						  </div>
						  <p><b>Select the paying fields</b></p>
						  <p>
						      <label>
						        <input type="checkbox" name="bill" value="roomrent"/>
						        <span>Room rent</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="electricitybill"/>
						        <span>Electricity Bill</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="waterbill"/>
						        <span>Water Bill</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="sewerbill"/>
						        <span>Sewer Bill</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="trashbill"/>
						        <span>Trash Bill</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="maintancebill"/>
						        <span>Maintance Bill</span>
						      </label>
						    </p>
						     <p>
						      <label>
						        <input type="checkbox" name="bill" value="fine"/>
						        <span>Fine</span>
						      </label>
						    </p>
							<div>
								<p><b>Weather he/she Paid completely?</b></p>
								<p>
						      <label>
						        <input type="checkbox" name="bill" value="yes"/>
						        <span>Yes</span>
						      </label>
						      </p>
						      <p>
						      <label>
						        <input type="checkbox" name="bill" value="partial"/>
						        <span>Partial</span>
						      </label></p><p>
						      <label>
						        <input type="checkbox" name="bill" value="no"/>
						        <span>No</span>
						      </label>
						      
						    </p>
							</div>			
						      
                    `	
                          <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Update</button>        
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	
	
<script>
	
	var table=document.getElementById("rents");
	var row=document.getElementById("rents").rows.length;
	var col=7;
	for(var x=1;x<row;x++){
		for(var y=1;y<col;y++){
			if(table.rows[x].cells[y].innerHTML==0)
				table.rows[x].cells[y].style.backgroundColor="#ccff90";
			else{
				table.rows[x].cells[y].style.backgroundColor="#ffcdd2";
			}
		}
	}	
	var s;
	function modal(i){
					s=table.rows[i+1].cells[0].innerHTML;	
					s=s.slice(3,s.length-4);
					document.getElementById("user_name").value=s;
	}
</script>
<script>
function elec(r){
	<%for(int i=0;i<b.size();i++){%>
	if(r==<%=i%>)
	document.getElementById("elecusername").value="<%=b.get(i).getName()%>"
	<%}%>
}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>