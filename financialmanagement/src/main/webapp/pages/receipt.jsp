
<%@ page isELIgnored="false" %><%@page import="com.app.models.BillModel"%>
<%@page import="java.util.ArrayList"%><%@page import="com.app.services.ReceiptService"%>
<%@page import="com.app.models.BillModel"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Receipt</title>
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
      <li class="nav-item  active">
        <a class="nav-link" href="#">Receipt</a>
      </li>
      <li class="nav-item">
       <li class="nav-item ">
        <a class="nav-link" href="usernotice.jsp">Notice</a>
      </li>
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
 
<%
response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");

		if(session.getAttribute("uname")==null)
			response.sendRedirect("login.jsp");
		String s=(String)session.getAttribute("uname");			
		//BillModel bm=new BillModel(null,0,0,0,0,0,0,0,0,0,"-",null);
		ReceiptService rs=new ReceiptService();
		ArrayList<BillModel>bm=new ArrayList<BillModel>();
		bm=rs.getReceipts(s);
		//if(session.getAttribute("receipt")!=null)
			//bm=(BillModel)session.getAttribute("receipt");
		
		//r=(BillModel)session.getAttribute("receipt");
		
	%>
	
 <% ArrayList<BillModel>r=bm; %>

<header>
	<div class="jumbotron">
	<div class="container" style="color:white;background-color: purple;display:flex;align-content: center;">
<div class="row m-auto">
	<h1>Your Monthly Bills</h1>
	</div>
</div>
	</div>
</header>


<div class="row" style="margin:auto;margin-left:250px">
<div cass="col-4-md"><input  id="t1" onchange="text1()"  type="text" placeholder="month(numbers)" name="month" required></div>
<div cass="col-4-md"><input  id="t2" onchange="text1()" type="text" placeholder="year(numbers)" name="year" required></div>
</div>

<div id="pre" style="color:gray;text-align: center;margin-top:100px;"><b>search for previous payments deatils..</b></div>

<div class="row" id="tab">
	<div class="container" style="display:flex;align-content: center">
		<div class="row m-auto" style="width:500px;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">Payment Receipt</span><br><br>
		<table class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th scope="col">Details</th>
      <th scope="col">Price</th>
    </tr>
  </thead>
  <tbody>
    <tr scope="row"><td>Room Rent</td><td id="1"></td></tr>
      <tr scope="row"><td>Electricity Bill</td><td id="2"></td></tr>
        <tr scope="row"><td>Water Bill</td><td id="3"></td></tr>
          <tr scope="row"><td>Trash Bill</td><td id="4"></td></tr>
            <tr scope="row"><td>Sewer Bill</td><td id="5"></td></tr>
              <tr scope="row"><td>Maintance Bill</td><td id="6"></td></tr>
                <tr scope="row" class="bg-primary"><td>Fine</td><td id="7"></td></tr>
                  <tr scope="row" class="bg-primary"><td>Total Pendings</td><td id="8"></td></tr>
                    <tr scope="row" class="bg-info"><td>Total Paid</td><td id="9"></td ></tr>
                      <tr scope="row" class="bg-info"><td>Bills Paid</td><td id="10"></td></tr>
                        <tr scope="row" class="bg-warning"><td>Date </td><td id="11"></td></tr>
                          <tr scope="row"><td></td><td></td></tr>
  </tbody>
</table> 
	</div>
	       </div>   
	   
	  </div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  
<script>
if(document.getElementById("t1").value=="" || document.getElementById("t2").value=="")
	{
	
	document.getElementById("pre").style.visibility="visible";
	document.getElementById("tab").style.visibility="hidden";
	}
function text1(){
	if(document.getElementById("t1").value=="" || document.getElementById("t2").value=="")
		{
		document.getElementById("pre").style.visibility="visible";
		document.getElementById("tab").style.visibility="hidden";
		}
	else{
		var m=document.getElementById("t1").value;
		var y=document.getElementById("t2").value;
		if(m.length==1)
			m='0'+m;
		var d=y+"-"+m;
		<%for(int i=0;i<r.size();i++){%>
		var s="<%=r.get(i).getDate()%>";
		if(s.indexOf(d)!=-1){
			var v="<%=r.get(i).getRoomrent()%>";
			if(v==0)
				document.getElementById("1").innerHTML="8000";
			else
				document.getElementById("1").innerHTML=v;
			v="<%=r.get(i).getElectricitybill()%>";
			if(v==0)
				document.getElementById("2").innerHTML="1300";
			else
				document.getElementById("2").innerHTML=v;
			v="<%=r.get(i).getWaterbill()%>";
			if(v==0)
				document.getElementById("3").innerHTML="500";
			else
				document.getElementById("3").innerHTML=v;
			v="<%=r.get(i).getTrashbill()%>";
			if(v==0)
				document.getElementById("4").innerHTML="100";
			else
				document.getElementById("4").innerHTML=v;
			v="<%=r.get(i).getSewerbill()%>";
			if(v==0)
				document.getElementById("5").innerHTML="200";
			else
				document.getElementById("5").innerHTML=v;
			v="<%=r.get(i).getMaintancebill()%>";
			if(v==0)
				document.getElementById("6").innerHTML="1000";
			else
				document.getElementById("6").innerHTML=v;
			v="<%=r.get(i).getFine()%>";
			document.getElementById("7").innerHTML=v;
			v="<%=r.get(i).getTotalpending()%>";
			document.getElementById("8").innerHTML=v;
			v="<%=r.get(i).getTotalpaid()%>";
			document.getElementById("9").innerHTML=v;
			v="<%=r.get(i).getPaid()%>";
			document.getElementById("10").innerHTML=v;
			v="<%=r.get(i).getDate()%>";
			document.getElementById("11").innerHTML=v;
		}
		<%}%>
		document.getElementById("pre").style.visibility="hidden";
		document.getElementById("tab").style.visibility="visible";
	}
		}

</script>
</body>
</html>