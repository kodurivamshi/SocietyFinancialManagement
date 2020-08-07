<%@page import="com.app.services.CommentService"%>
<%@page import="com.app.models.CommentModal"%>
<%@page import="com.app.models.LikeModal"%>
<%@page import="com.app.services.NoticeService"%>
<%@page import="com.app.dao.NoticeDao"%>
<%@ page isELIgnored="false" %><%@page import="com.app.models.NoticeModel"%>
<%@page import="java.util.ArrayList"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Notice page</title>
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
      <li class="nav-item  active">
        <a class="nav-link" href="#" >Notice</a>
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
		NoticeService ns=new NoticeService();
		CommentService cs=new CommentService();
		ArrayList<Integer>c=new ArrayList<Integer>();
		ArrayList<LikeModal>lm=new ArrayList<LikeModal>();
		ArrayList<NoticeModel>nm=new ArrayList<NoticeModel>();
		ArrayList<CommentModal>cm=new ArrayList<CommentModal>();
		if(session.getAttribute("admin")==null)
			response.sendRedirect("login.jsp");
		else if(!session.getAttribute("admin").equals("admin"))
			response.sendRedirect("login.jsp");
		else{
			nm=ns.getNotice();
			lm=ns.getLikes((String)session.getAttribute("admin"));
			cm=cs.getComments();
			c=ns.getLikes();
		}
%>

<% ArrayList<Integer>c1=c; %>
<% ArrayList<CommentModal>cm1=cm; %>
<% ArrayList<LikeModal>lm1=lm; %>
<% ArrayList<NoticeModel>nm1=nm; %>
<%if(nm.size()==0) {%>
<div style="text-align: center;margin-top: 250px;color: gray;">
        		<b><h3>----- No posts ------</h3></b>
        	</div>
        	<%} %>
<%for(int i=0,K=0;i<nm.size();i++,K+=3){ %>
<div style="display:flex;justify-content:center;flex-direction: column;align-content: center;align-items: space-between;">
	<div style="border:5px slid black;width:500px;padding-left:20px;margin-left:200px">
			<div style="text-align: center">
				<div><h3><b><%=nm.get(i).getHead() %></b></h3></div>
			</div>
			<div style="margin-top:20px;">
				<p>Date: &nbsp<%=nm.get(i).getDate() %></p>
			</div>
			<div style="margin-top:20px;">
				<p>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <%=nm.get(i).getBody() %></p>
			</div>
			
	</div>
	
	<div  style="display: flex;flex-direction: row;margin-left:300px">
	<div>
		<form action="deletepost" method="post">
		<input type="hidden" value="<%=nm.get(i).getId() %>" name="id1">
	    <button type="submit"  class="btn  btn-sm ml-auto"  data-dismiss="modal">Delete Post</button>
        </form>
        </div>
		
			<div>
	    <button  data-toggle="modal" onclick="modal(<%=nm.get(i).getId() %>)" data-target="#amountmodal" class="btn  btn-sm ml-auto"  data-dismiss="modal">Post Agreed</button>
        </div>
        
		        	
        <div>
        <button data-toggle="modal" onclick="modal(<%=nm.get(i).getId() %>)" data-target="#commentmodal" type="button" class="btn btn-primary btn-sm ml-1">Comments</button>        
		</div>
		<div style="display: flex;flex-direction: row;">
		<div >
		<p><i>Agreed:&nbsp</i></p><p><span class="badge bg-success text-white"><%=c.get(K+1)%></span></p>&nbsp&nbsp&nbsp</div>
		<div><p><i>DisAgreed:&nbsp</i></p><p><span class="badge bg-danger text-white"><%=c.get(K+2)%></span></p></div>
		</div>
		<div>
		</div>
	</div>
</div>
<hr>	
<%} %>

<div id="commentmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Comments</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
               
                    		<div id="container">
                    		
                    		</div>
               	     <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button data-toggle="modal"  data-target="#addcomment" class="btn btn-primary btn-sm ml-1">Add Comment</button>        
                    </div>
                   
                </div>
            </div>
        </div>
    </div>


<div id="addcomment" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Add Comment</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                <form action="addcomment" method="post">
                	<input type="hidden" id="hidden" name="id">
                	<div class="row">
					        <div class="input-field col">
					          <textarea rows="20" cols="20" name="comment"></textarea>
					          <label for="subject">Comment</label>
					        </div>
				 </div>
                    <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Comment</button>        
                    </div>
                   </form>
                </div>
            </div>
        </div>
    </div>

<div id="amountmodal" class="modal fade" role="dialog">
        <div class="modal-dialog modal-lg" role="content">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Amount Required?</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                <form action="addcomment" method="get">
                	<input type="hidden" id="hidden1" name="id2">
                	<div class="row">
					        <div class="input-field col">
					           <input   type="text" name="amount" class="validate"  required>
          <label for="amount">enter Amount</label>
   
					        </div>
				 </div>
                    <div class="form-row">
                            <button type="button" class="btn btn-warning btn-sm ml-auto" data-dismiss="modal">Cancel</button>
                            <button type="submit" class="btn btn-primary btn-sm ml-1">Accept</button>        
                    </div>
                   </form>
                </div>
            </div>
        </div>
    </div>



<script>
	function modal(r){
		console.log(r);
		document.getElementById("hidden").value=r;
		document.getElementById("hidden1").value=r;
		
		document.getElementById("container").innerHTML="";
		<%for(int i=0;i<cm1.size();i++){%>
			if(r=="<%=cm1.get(i).getId()%>")
				{console.log("<%=cm1.get(i).getComment()%>")
					var p=document.createElement("p");
					p.innerHTML="<%=cm1.get(i).getUsername()%>";
					p.style.color="blue";
					var c=document.createElement("p");
					c.innerHTML="<%=cm1.get(i).getComment()%>";
					document.getElementById("container").appendChild(p);
					document.getElementById("container").appendChild(c);
				}
		<%}%>
	}
	
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>  

</body>
</html>