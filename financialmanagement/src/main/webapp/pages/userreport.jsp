
<%@page import="com.app.models.YearMaintenanceModel"%>
<%@page import="com.app.models.MaintenanceModel"%>
<%@page import="com.app.services.ReportService"%>
<%@ page isELIgnored="false" %>
<%@page import="java.util.ArrayList"%>
<%@ page import="java.util.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Report page</title>
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
      <li class="nav-item">
        <a class="nav-link" href="guidlines.jsp" >Guidelines</a>
      </li>
       <li class="nav-item  active">
        <a class="nav-link" href="#" >Report</a>
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
ArrayList<String>a=new ArrayList<String>();
ArrayList<String>b=new ArrayList<String>();
MaintenanceModel m=new MaintenanceModel(0,0,0,0,0,0,0,0);
ArrayList<MaintenanceModel> mm=new ArrayList<MaintenanceModel>();
ArrayList<YearMaintenanceModel> ymm=new ArrayList<YearMaintenanceModel>();
MaintenanceModel m1=new MaintenanceModel();
if(session.getAttribute("admin")==null && session.getAttribute("uname")==null)
	response.sendRedirect("login.jsp");
else{
	ReportService rs=new ReportService();
	a=rs.getInnames();
	b=rs.getOutnames();
	m=rs.getFee();
	mm=rs.getAllMaintenancefee();
	ymm=rs.getAllYearMaintenancefee();
}
%>
<%
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
for(int i=0;i<(mm.size());i++){
int expen=mm.get(i).getWorkersfee()+mm.get(i).getGoodsFee()+mm.get(i).getLiftBill() ;
map = new HashMap<Object,Object>();
if(i==0)
map.put("label", "January");
if(i==1)
map.put("label", "February"); 
if(i==2)
map.put("label", "March"); 
if(i==3)
map.put("label", "April"); 
if(i==4)
map.put("label", "May"); 
if(i==5)
map.put("label", "June"); 
if(i==6)
map.put("label", "July"); 
if(i==7)
map.put("label", "August"); 
if(i==8)
map.put("label", "September"); 
if(i==9)
map.put("label", "October"); 
if(i==10)
map.put("label", "November"); 
if(i==11)
map.put("label", "December");  

map.put("y", expen); 
list.add(map);
}
String dataPoints = gsonObj.toJson(list);

Gson gsonObj1 = new Gson();
Map<Object,Object> map1 = null;
List<Map<Object,Object>> list1 = new ArrayList<Map<Object,Object>>();
for(int i=0;i<(ymm.size());i++){
int expen=ymm.get(i).getExpenditure();
int year=ymm.get(i).getYear();
map1 = new HashMap<Object,Object>();
map1.put("label",year);
map1.put("y", expen); 
list1.add(map1);
}
String dataPoints1 = gsonObj1.toJson(list1);
%>
 
<% int month=m.getId();%>
<div>
	<div style="text-align: center;color:red;margin-top:20px;margin-bottom: 20px"><h2><b>MAINTENANCE &nbspREPORT</b></h2></div>
</div>

<div class="accordion" id="accordionExample">
  <div class="card">
    <div class="card-header" id="headingOne">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          <h5><b>In ward Payment for a given date range</b></h5>
        </button>
      </h2>
    </div>

    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordionExample">
      <div class="card-body">
       			<div style="text-align: center;">
       				<h6><b>Maintenance Bill Payment Report</b></h6> <div style="display:flex;justify-content: center;">
       				<div><i>before 10th of the &nbsp</i></div>
       				<div><i><p id="month"></p></i></div></div>
       			</div>
       			<div class="container" style="margin-top:20px">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">List of Flat members's Paid on time</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th>S.No</th>
      <th>Name</th>
    </tr>
  </thead>
  <tbody>
  	<%for(int i=0;i<a.size();i++){ %>
  		<tr><td><b><%=i+1 %></b></td><td><%=a.get(i) %></td>
  	<%} %>
    </tbody>
</table>
	</div>
	       </div> 
	       </div>
	       </div>
	       </div>
	       
  <div class="card" >
    <div class="card-header" id="headingTwo">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button"  data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          <h5><b>Families who make frequent delayed payment</b></h5>
        </button>
      </h2>
    </div>
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      <div class="card-body">
      <div style="text-align: center;">
       				<h6><b>Maintenance Bill Payment Report</b></h6><div style="display:flex;justify-content: center;">
       				<div><i>after 10th of the &nbsp</i></div>
       				<div><i><p id="month1"></p></i></div></div>
       			</div>
       			</div>
       			<div class="container" style="margin-top:20px">
		<div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">List of Flat members's Paid delay</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th>S.No</th>
      <th>Name</th>
    </tr>
  </thead>
  <tbody>
  	<%for(int i=0;i<b.size();i++){ %>
  		<tr><td><b><%=i+1 %></b></td><td><%=b.get(i) %></td>
  	<%} %>
    </tbody>
</table>
	</div>
	       </div> 
	    
      </div>
    </div>
  </div>
  <div class="card">
    <div class="card-header" id="headingThree">
      <h2 class="mb-0">
        <button class="btn btn-link btn-block text-left collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <h5><b>Monthly Payments by society </b></h5>
        </button>
      </h2>
    </div>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
      <div class="card-body">
        <div style="text-align: center;">
        	<h6><b>Report on Usage of Monthly Maintenance Bill</b></h6>
        </div>
        
        <div class="container" style="margin-top:20px">
       		<div style="display:flex;justify-content: flex-start;">
					<div><i>Month: &nbsp</i></div>
       				<div><i><b><p id="month3"></p></b></i></div></div>
       			</div>
      
       <div class="row" style="width:auto;padding:10px;margin-left:10px;">
		<span class="badge bg-danger" style="color:white">List of Payments done by Society</span><br><br>
		<table id="rents" class="table table-hover table-primary">
  <thead>
    <tr class="table-secondary">
      <th>Total Maintenance Bill</th>
      <th>Worker's Fee</th>
      <th>Goods Fee</th>
      <th>Lift Bill</th>
      <th>Savings</th>
    </tr>
  </thead>
  <tbody>
  	
  		<tr><td><b><%=m.getMaintenanceFee() %></b></td><td><%=m.getWorkersfee() %></td><td><%=m.getGoodsFee() %></td><td><%=m.getLiftBill() %></td><td><%=m.getSavings() %></td>
  		</tr>
    </tbody>
</table>
	 <div>Worker's fee includes the <i><b>security gaurd salary</b></i> <%=m.getSecurityFee() %> and  <i><b>Cleaner salary </b> </i> <%=m.getCleanerFee() %> . </div>
	<div>Here Good's fee includes all maintenance repairs fee.</div>
	</div>
		   
	       </div> 
        
      </div>
    </div>
  </div>
</div>
<div id="chartContainer" style="height: 370px; width: 50%;"></div>
<div id="chartContainer1" style="margin-top30px;height: 370px; width: 50%;"></div>

<script>
var month="<%=month%>";
var a=["January","Febraury","March","April","May","June","July","August","September","October","November","December"];
console.log(a[month-1]);
document.getElementById("month").innerHTML="  "+a[month-1];
document.getElementById("month1").innerHTML="  "+a[month-1];
document.getElementById("month3").innerHTML="  "+a[month-1];

</script>
<script type="text/javascript">
window.onload = function() { 
 
var chart = new CanvasJS.Chart("chartContainer", {
	theme: "light2",
	title: {
		text: "Monthly Maintenance Expenditure"
	},
	axisX: {
		title: "Months"
	},
	axisY: {
		title: "Maintenance Expenditure ( in rupees )"
	},
	data: [{
		type: "line",
		yValueFormatString: "#,##0 rupees",
		dataPoints : <%out.print(dataPoints);%>
	}]
});
chart.render();
var chart = new CanvasJS.Chart("chartContainer1", {
	theme: "light2",
	title: {
		text: "Yearly Maintenance Expenditure"
	},
	axisX: {
		title: "Years"
	},
	axisY: {
		title: "Maintenance Expenditure ( in rupees )"
	},
	data: [{
		type: "line",
		yValueFormatString: "#,##0 rupees",
		dataPoints : <%out.print(dataPoints1);%>
	}]
});
chart.render();
 

}
</script>
<script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>