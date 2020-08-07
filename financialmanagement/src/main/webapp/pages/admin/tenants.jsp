<%@page import="com.app.models.AdressModal"%>
<%@page import="com.app.models.MembersModal"%>
<%@page import="com.app.models.RegisterModel"%>
<%@ page isELIgnored="false" %><%@page import="com.app.models.BillModel"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Tenants page</title>
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
      <li class="nav-item active">
        <a class="nav-link" href="#">Tenants</a>
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
		ArrayList<RegisterModel>bm=new ArrayList<RegisterModel>();
		ArrayList<MembersModal>mm=new ArrayList<MembersModal>();
		ArrayList<AdressModal>am=new ArrayList<AdressModal>();
		if(session.getAttribute("admin")==null)
			response.sendRedirect("login.jsp");
		else if(!session.getAttribute("admin").equals("admin"))
			response.sendRedirect("login.jsp");
		else{
		bm=(ArrayList<RegisterModel>)session.getAttribute("tenants");
		mm=(ArrayList<MembersModal>)session.getAttribute("members");
		am=(ArrayList<AdressModal>)session.getAttribute("oldusers");
		
		}
%>
<% ArrayList<MembersModal>mm1=mm ;%>
<% ArrayList<RegisterModel>rm=bm;%>
<div class="row">
	<div class="container">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Tenants</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th scope="col">UserName</th>
      <th scope="col">FulName</th>
      <th scope="col">Email</th>
      <th scope="col">Gender</th>
      <th scope="col">Mobile No.</th>
      <th scope="col">Floor No.</th>
      <th scope="col">Flat No.</th>
         <th scope="col">Family Member</th>
         <th scope="col">Actions</th>
         
    </tr>
  </thead>
  <tbody>
		<% for(int i=0;i<bm.size();i++) {%>
			<tr onclick="modal(<%=i %>)">
							<td  data-toggle="modal"  data-target="#loginModal" class="bg-warning"><b><%=bm.get(i).getUname() %></b></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getFullname() %></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getEmail()%></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getGender() %></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getMobile() %></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getFloor()%></td>
							<td data-toggle="modal"  data-target="#loginModal" ><%=bm.get(i).getFlat()%></td>
							<td><button data-toggle="modal" onclick="people(<%=i %>)" data-target="#addmodal" type="button" class="btn btn-primary">Add</button></td>
							<td><button data-toggle="modal" onclick="modalupdate(<%=i %>)" data-target="#updateModal" type="button" class="btn btn-warning">Update</button>&nbsp<button data-toggle="modal" data-target="#deleteModal" onclick="modaldelete(<%=i %>)" type="button" class="btn btn-danger">Delete</button></td>
							
			</tr>
		<%} %>  		
    </tbody>
</table>
	</div>
	       </div> 
</div>  

<div id="loginModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Family Members</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<div style="align-items: flex-start; display:flex">
                		<span class="badge bg-danger" style="color:white">Total family count</span>&nbsp<p><b><h5 style="color:red" id="fc"></h5></b></p>
                	</div>
                
                	<div class="row">
	<div class="container">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Family Menber's</span><br><br>
		<table id="members" class="table table-hover table-primary">
 
</table>
	</div>
	       </div> 
</div>  
</div>

</div>
</div>
</div>
                	
<div id="updateModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Update User's Data</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                <form action="userupdate" method="post">
                	<div style="align-items: flex-start; display:flex">
                		<span class="badge bg-danger" style="color:white">Total family count</span>&nbsp<p><b><h5 style="color:red" id="fc"></h5></b></p>
                	</div>
                	<div class="input-field col s6">
                	 <input  id="username" type="text" name="username" class="validate"   required>
                	 </div>
                	 <div class="input-field col s6"> <input  id="fullname" type="text" name="fullname" class="validate"  required>
                	   <input  id="email" type="text" name="email" class="validate"  required>
                	   </div>
                	   <div class="input-field col s6"> <input  id="gender" type="text" name="gender" class="validate"  required>
                	     </div>
                	     <div class="input-field col s6"><input  id="mobile" type="text" name="mobile" class="validate"  required>
                	     </div>
                	     <div class="input-field col s6"> <input  id="floor" type="text" name="floor" class="validate"  required>
                	       </div>
                	       <div class="input-field col s6"><input id="flat" type="text" name="flat" class="validate"  required>
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
                	
    <div id="deleteModal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete User</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<form action="deleteuser" method="post">
                	<div>
                		<p>Do you want to delete ?</p> <input style="color:red" id="deleteusername" type="text" name="deleteusername"  class="validate"  required>
                	</div>
                	<div><p>please enter your new address</p></div>
                	<div class="input-field col s6">
				          <input   type="text" class="validate" name="flat"  required>
				          <label for="flat NO.">Flat No.</label>
				        </div>
				        <div class="input-field col s6">
				          <input  type="text" class="validate" name="apartment"  required>
				          <label for="apartment">Apartment Name</label>
				        </div>
				    
				    <div class="input-field col s6">
				          <input type="text" class="validate" name="street" required>
				          <label for="street">Street Name</label>
				        </div>
				    
				    <div class="input-field col s6">
				          <input type="text" class="validate" name="city" required>
				          <label for="city">city</label>
				        </div>
				        <div class="input-field col s6">
				          <input type="text" class="validate" name="state" required>
				          <label for="state">State</label>
				        </div>
				    
				                		 <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Delete</button>        
                        </div>
                	</form>
                	
                </div>
        </div>
    </div>
    </div>
	
	  <div id="addmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Members</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<form action="addmember" method="post">
                	 <input style="color:red" id="addusername" type="text" name="addusername"  class="validate"  required>
                	 <div class="row">
					        <div class="input-field col s6">
					          <input id="family" type="text" onchange="people()" name="family" class="validate" required>
					          <label for="family">No. of members you were adding</label>
					        </div>
					  </div>
                	
                		<div class="row blue-grey darken-1">
				      		 <div  id="member" class="input-field col s6">
				      		 		
				      		 </div>
				      	</div>
				      	 <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Add</button>        
                        </div>
                	</form>
                	
                </div>
        </div>
    </div>
    </div>
	
	
	
 <div id="deletemember" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Delete User</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<form action="deletemember" method="post">
                	<div>
                		<p>Do you want to delete ?</p> <input  id="deletemem" type="text" name="deletemember"  class="validate"  required>
                	</div>
                		 <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Delete</button>        
                        </div>
                	</form>
                	
                </div>
        </div>
    </div>
    </div>
	<div style="margin-left:500px">
		<button data-toggle="modal"  data-target="#oldermodal" type="button" class="btn btn-warning">Previous Users</button>
	</div>
	<div id="oldermodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">previous Users</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                	<div class="row">
	<div class="container">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Tenants</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th scope="col">UserName</th>
      <th scope="col">Mobile</th>
      <th scope="col">Stayed Flat</th>
      <th scope="col">New Flat</th>
      <th scope="col">Apartments</th>
      <th scope="col">Street</th>
      <th scope="col">City</th>
         <th scope="col">State</th>         
    </tr>
  </thead>
  <tbody>
		<% for(int i=0;i<am.size();i++) {%>
			<tr onclick="modal(<%=i %>)">
							<td  ><b><%=am.get(i).getUsername()%></b></td>
							<td  ><%=am.get(i).getMobile()%></td>
							<td ><%=am.get(i).getStayedFlat()%></td>
							<td  ><%=am.get(i).getFlat()%></td>
							<td  ><%=am.get(i).getApartment() %></td>
							<td  ><%=am.get(i).getStreet()%></td>
							<td ><%=am.get(i).getCity()%></td>
							<td><%=am.get(i).getState() %></td>	
			</tr>
		<%} %>  		
    </tbody>
</table>
	</div>
	       </div> 
</div>  
                	
                 </div>
        </div>
    </div>
    </div>
 <script>
var m="<%=mm1%>";
var u="<%=rm%>";
console.log(u,m);
var table=document.getElementById("members");
function modal(r){
	table.innerHTML="";
	var h=document.createElement("thead");
	var r1=document.createElement("tr");
	var h1=document.createElement("th");
	var h2=document.createElement("th");
	var h3=document.createElement("th");
	var h4=document.createElement("th");
	
	h1.innerHTML="Name";
	h2.innerHTML="Gender";
	h3.innerHTML="Relation";
	h4.innerHTML="Action";
	r1.appendChild(h1);
	r1.appendChild(h2);
	r1.appendChild(h3);
	r1.appendChild(h4);
	h.style.backgroundColor="#e3f2fd";
	h.appendChild(r1);
	table.appendChild(h);
			<% for(int i=0;i<rm.size();i++){%>
			
			if(r=="<%=i%>"){
				document.getElementById("fc").innerHTML="0";

				<%for(int j=0;j<mm1.size();j++){%>
				console.log("<%=rm.get(i).getUname()%>","<%=mm1.get(j).getUsername()%>");
					if("<%=rm.get(i).getUname()%>"=="<%=mm1.get(j).getUsername()%>"){
						console.log("ss");
						document.getElementById("fc").innerHTML="";

						document.getElementById("fc").innerHTML="<%=mm1.get(j).getFamilycount()%>";
						console.log("<%=mm1.get(j).getFamilycount()%>");
						var row=document.createElement("tr");
						var td1=document.createElement("td");
						td1.style.fontSize="15px";
						var td2=document.createElement("td");
						var td3=document.createElement("td");
						var td4=document.createElement("td");
						var b=document.createElement("input");
						b.setAttribute("value","Delete");
						b.setAttribute("type","button");
						b.setAttribute("class","btn btn-warning btn-sm ml-auto");
						b.setAttribute("data-toggle","modal");
						b.setAttribute("data-target","#deletemember");
						b.addEventListener("click",()=>{
							document.getElementById("deletemem").value="<%=mm1.get(j).getName()%>";
						})
						td1.innerHTML="<%=mm1.get(j).getName()%>";
						td2.innerHTML="<%=mm1.get(j).getGender()%>";
						td3.innerHTML="<%=mm1.get(j).getRelation()%>";
						console.log("<%=mm1.get(j)%>")
						row.appendChild(td1);
						row.appendChild(td2);
						row.appendChild(td3);
						td4.appendChild(b);
						row.appendChild(td4);
						table.appendChild(row);
					}
				<%}%>
			}
			<%}%>
}
function modalupdate(r){
	<% for(int i=0;i<rm.size();i++){%>
	if(r=="<%=i%>"){
		console.log(r);
		document.getElementById("username").value="<%=rm.get(i).getUname()%>";
		document.getElementById("fullname").value="<%=rm.get(i).getFullname()%>";
		document.getElementById("email").value="<%=rm.get(i).getEmail()%>";
		document.getElementById("gender").value="<%=rm.get(i).getGender()%>";
		document.getElementById("mobile").value="<%=rm.get(i).getMobile()%>";
		document.getElementById("floor").value="<%=rm.get(i).getFloor()%>";
		document.getElementById("flat").value="<%=rm.get(i).getFlat()%>";
	}
	<%}%>
}
function modaldelete(r){
	<% for(int i=0;i<rm.size();i++){%>
	if(r=="<%=i%>"){
		console.log(r);
		document.getElementById("deleteusername").value="<%=rm.get(i).getUname()%>";
	}
	<%}%>
}
function people(r){
	<% for(int i=0;i<rm.size();i++){%>
	if(r=="<%=i%>"){
		console.log(r);
		document.getElementById("addusername").value="<%=rm.get(i).getUname()%>";
	}
	<%}%>
	var p=document.getElementById("family").value;
  	var con=document.getElementById("member");
  	con.innerHTML="";
  	for(var i=0;i<p;i++){
  		var name=document.createElement("input");
  		name.setAttribute("type","text");
  		name.setAttribute("name","name1");
  		name.setAttribute("placeholder","name of person "+(i+1));
  		//name.style.float = 'left';
  		con.append(name);
  		var rel=document.createElement("input");
  		rel.setAttribute("type","text");
  		rel.setAttribute("name","rel1");
  		rel.setAttribute("placeholder","relationship with that person "+(i+1));
  		//age.style.float = 'left';
  		con.append(rel);
  		var gen1=document.createElement("input");
  		gen1.setAttribute("type","text");
  		gen1.setAttribute("name","gen1");
  		gen1.setAttribute("placeholder","Gender of person "+(i+1));
  		//gen1.style.float = 'left';
  		con.append(gen1);
  	}
  }
 
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  


</body>
</html>