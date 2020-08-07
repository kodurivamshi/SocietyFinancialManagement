<html>
<head>
<title>Login Page</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
</head>
<body>
<!-- <div class="row">
        <div class="input-field col s12">
          <input id="email" type="email" class="validate">
          <label for="email">Email</label>
        </div>
      </div>-->
  
   <form class="col" action="login">
   <div class="row">
    <div class="col s5">
      <div class="card blue-grey darken-1">
        <div class="card-content white-text">
          <span class="card-title">Login</span>
          
          <div class="row">
        <div class="input-field col s6">
          <input  id="user_name" type="text" name="username" class="validate"  required>
          <label for="user_name">UserName</label>
        </div>
      </div>
      
      <div class="row">
        <div class="input-field col s6">
          <input id="password" type="password" class="validate" name="password" required>
          <label for="password">Password</label>
        </div>
      </div>
      
        <div class="card-action">
          <button class="btn waves-effect waves-light" onclick="alertName()"  type="submit" name="action">lOGIN</button>
          <a class="waves-effect waves-light btn" href="register.jsp">Register</a>
        </div>
        
        
      </div>
    </div>
  </div>
</div>
  </form>
     
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
  
 </script>  
</body>
</html>