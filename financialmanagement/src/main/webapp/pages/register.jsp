<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
<title>Register Page</title>
</head>
<body>
	 <form class="col" action="register" method="post">
   <div class="row">
    <div class="col s5">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Register</span>
           <div class="row">
        <div class="input-field col s6">
          <input style="color:white" id="email" type="text" class="validate" name="fullname" required>
          <label for="fullname">Full Name</label>
        </div>
         <div class="input-field col s6">
          <input style="color:white" id="user_name" type="text" name="username" class="validate" required>
          <label for="user_name">UserName</label>
        </div>
        </div>

        <div class="row">
        <div class="input-field col s6">
          <input style="color:white" id="email" type="email" class="validate" name="email" required>
          <label for="email">Email</label>
        </div>
         <div class="input-field col s6">
          <input style="color:white" id="mobilenumber" type="tel" class="validate" name="mobile" required>
          <label for="mobile">Mobile No.</label>
        </div>
        </div>
      <div class="row">
        <div class="input-field col s6">
          <input style="color:white" id="password" type="password" class="validate" name="password" required>
          <label for="password">Password</label>
        </div>
      </div>
       <div class="row">
       	<div class="input-field col s6">
       		<p>
      <label>
        <input name="gender"  value="Male" type="radio" checked  />
        <span style="color:white">Male</span>
      </label>
 
   
      <label>
        <input name="gender"  value="Female" type="radio" checked />
        <span style="color:white" >Female</span>
      </label>
    </p>
       	
       	</div>
        </div>
          <div class="row">
        <div class="input-field col s6">
          <input style="color:white" id="floor" type="text" name="floor" class="validate" required>
          <label for="Floor">floor No.</label>
        </div>
        <div class="input-field col s6">
          <input style="color:white" id="flat" type="text" name="flat" class="validate" required>
          <label for="flatS">Flat No.</label>
        </div>
      </div>
        
      <hr>
          <div class="row">
        <div class="input-field col s6">
          <input style="color:white" id="family" type="text" onchange="people()" name="family" class="validate" required>
          <label for="family">Family count</label>
        </div>
      </div>
      <div class="row">
      		 <div  id="members" class="input-field col s6">
      		 
      		 </div>
      </div>
        <div class="card-action">
          <button class="btn waves-effect waves-light" type="submit" name="action">Register</button> 
        </div>
         <a href="login.jsp" style="color:white">Account exist?</a>     
      </div>
    </div>
  </div>
</div>
  </form>
  <script>
  function people(){
  	var p=document.getElementById("family").value;
  	var con=document.getElementById("members");
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
   <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
 
</body>
</html>