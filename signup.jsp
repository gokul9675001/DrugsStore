<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sign Up Form</title>
<link rel="stylesheet" href="stylesheet/signup.css"/>
</head>
<body>
    <fieldset>
        <!-- <legend>Sign Up</legend> -->
        <h1>Sign Up</h1>
        <form name="signupForm" action="signUp" method="post" onsubmit="return validateForm()">
            <label for="name">Full Name</label><br>
            <input type="text" name="fullname" placeholder="Enter Full Name"/><br>
            <span class="validationError" id="fullnameError"></span><br>
            <label for="email">Email</label><br>
            <input type="text" name="email" placeholder="Enter Email Address"/><br>
            <span class="validationError" id="emailError"></span><br>
            <label for="password">Password</label><br>
            <input type="password" name="pass" placeholder="Enter Password"/><br>
            <span class="validationError" id="passwordError"></span><br>
            <label for="re-enterpass">Re-enter Password</label><br>
            <input type="password" name="repass" placeholder="Re-enter Password"/><br>
            <span class="validationError" id="repassError"></span><br>
            <%  String msg = (String) request.getAttribute("msg"); 
                String msg2 = (String) request.getAttribute("msg2"); 
            	String msg3 = (String) request.getAttribute("msg3");
                if(msg != null)
                {
            %>

            	<span id="serverError"><%= msg %></span>
            
            <%  }
                else if(msg2 != null)
                {
            %>
                    <span id="serverError2"><%= msg2 %></span>
            <%  }
             	else if(msg3 != null)
            	{
            %>	
            		<span id=serverError3><%= msg3 %></span>
            <%	} %>

            <input class="btn-signup" type=submit name="submit" value="Sign Up"/>
        </form>
        
        <p>Already have a account<a href="login.jsp">Log In Here</a></p>
    </fieldset>    
    <script>
    function validateForm() {
        var fullname = document.forms["signupForm"]["fullname"].value;
        var email = document.forms["signupForm"]["email"].value;
        var pass = document.forms["signupForm"]["pass"].value;
        var repass = document.forms["signupForm"]["repass"].value;
        
        var error = false;
        
        // Reset previous error messages
        document.getElementById("fullnameError").innerHTML = "";
        document.getElementById("emailError").innerHTML = "";
        document.getElementById("passwordError").innerHTML = "";
        document.getElementById("repassError").innerHTML = "";

        if (fullname == "") {
            document.getElementById("fullnameError").innerHTML = "Please enter your full name.";
            error = true;
        }

        if (email == "") {
            document.getElementById("emailError").innerHTML = "Please enter your email address.";
            error = true;
        } else {
            var emailRegex = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
            if (!email.match(emailRegex)) {
                document.getElementById("emailError").innerHTML = "Please enter a valid email address.";
                error = true;
            }
        }

        if (pass == "") {
            document.getElementById("passwordError").innerHTML = "Please enter a password.";
            error = true;
        }
        else if(pass.length < 8)
        {
        	document.getElementById("passwordError").innerHTML = "Password is must at least more then 8 characters.";
        	 error = true;
        }
        else if(!/[A-Z]/.test(pass))
        {
        	document.getElementById("passwordError").innerHTML = "Password is must have at least a upperchase character.";
        	 error = true;
        }
        else if(!/\d/.test(pass))
        {
        	document.getElementById("passwordError").innerHTML = "Password is must have at least a digit or number.";
        	 error = true;
        }
        else if(!/[!@#$%^&*]/.test(pass))
        {
        	document.getElementById("passwordError").innerHTML = "Password is must have a special character [!@#$%^&*].";
        	 error = true;
        }

        if (repass == "") {
            document.getElementById("repassError").innerHTML = "Please re-enter your password.";
            error = true;
        }

        //if (pass !== repass) {
          //  document.getElementById("repassError").innerHTML = "Passwords do not match.";
           // error = true;
        //}
        
        return !error;
    }
    </script>
    </body>
</html>
