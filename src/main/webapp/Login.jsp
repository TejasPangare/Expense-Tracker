<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="edu.jsp.entity.User"%>
<%@page import="edu.jsp.dao.UserDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            width:q
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url("https://t4.ftcdn.net/jpg/09/44/64/37/240_F_944643754_rK863867VXWB7ImoSJ7y7UyBjhwFdKk1.jpg");
            background-repeat: no-repeat;
            background-size: cover;
        }
        .login-container {
            background-color: #1f1e41;
            color:#ffff;
            padding: 30px;
            border-radius: 10px;
            width: 400px;
            box-shadow: 0px 0px 20px rgb(46, 44, 44);
            border: 15px solid black;
            border-style: double none;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin: 10px 0 5px;
        }
        input[type="email"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border-radius: 5px;
            font-size: 1rem;
            outline: none;
        }
        button {
            width: 100%;
            padding: 10px;
            font-size: 1.2rem;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
        .error-message {
            color: red;
            font-size: 0.9rem;
            display: none;
        }
        .home-logout{
            position: absolute;
            top: 2rem;
            left: 2rem;
            display: flex;
            gap: 1rem;
        }
        .login-container a{
        	display : block;
        	text-decoration: none;
        	padding : 1rem;
        	width:100%;
        	text-align: center;
        	color:red;
        }
    </style>
</head>
<body>
<%

String message = (String)request.getAttribute("message") ;
String pwd = (String)request.getAttribute("password");
if(pwd != null){
%>
	<script>
		alert("<%=pwd%>");
	</script>
<%} %>
<div class="home-logout">
        <a href="home.jsp?currentUser=<%=session.getAttribute("currentUser")%>"><button title="Home"><i class="fa-solid fa-house fa-bounce"></i></button></a>
        <a href="logout"><button title="Logout"><i class="fa-solid fa-right-from-bracket fa-bounce"></i></button></a>
    </div>
<div class="login-container">
    <h2>Login</h2>
    <form id="loginForm" action="login" method="post">
    		<%
		if (message != null) {
		%>
		<h3 style="color:red"><%=message%></h3>
		<%
		}
		%>
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" minlength="3" maxlength="5" required>
        <button type="submit">Login</button>
        <a href="" onclick="displayPassword()" id="forgot-pass">Forgot password? <br>Click here to get...</a>
        <a href="Register.jsp">Don't have an account? <br>Click here to register...</a>
    </form>
    <script>
    	function displayPassword(){
    		let email= prompt("Please enter your email", "@gmail.com")
    		if(email!=null)
    			{
		    		var x = document.getElementById("forgot-pass");
		    		x.href = "forgotPassword?email="+email;
    			}
    		else{
		    		alert("PLEASE ENTER A VALID EMAIL");    			
    		}
    	}
    </script>
</div>
</body>
</html>
