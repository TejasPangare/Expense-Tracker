<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: url("https://t4.ftcdn.net/jpg/09/81/68/81/240_F_981688145_7o3eA65EtnyXMqqFaZ9NSYs2xMzFt3KQ.jpg");
            background-repeat: no-repeat;
            background-size: cover;
           	color: #ffff;
        }
        .register-container {
            background-color: #1f1e41;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 400px;
            box-shadow:0px 0px 20px rgb(46, 44, 44);
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
        input[type="text"], input[type="email"], input[type="password"],input[type="number"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            outline:none;
            border:none;
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
        .home-logout{
            position: absolute;
            top: 2rem;
            left: 2rem;
            display: flex;
            gap: 1rem;
        }
        .register-container a{
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

<div class="home-logout">
        <a href="home.jsp?currentUser=<%=session.getAttribute("currentUser")%>"><button title="Home"><i class="fa-solid fa-house fa-bounce"></i></button></a>
        <a href="logout"><button title="Logout"><i class="fa-solid fa-right-from-bracket fa-bounce"></i></button></a>
    </div>
<div class="register-container">
    <h2>Register</h2>
    <form id="registerForm" action="register" method="post">
    	<%
		String message = (String)request.getAttribute("message") ;
		if (message != null) {
		%>
		<h3 style="color:red"><%=message%></h3>
		<%
		}
		%>
        <label for="name">Name:</label>
        <input type="text" id="name" name="name" required>
        
        <label for="mobile">Mobile:</label>
        <input type="number" id="mobile" name="mobile" required>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" minlength="3" maxlength="5" required>

        <button type="submit">Register</button>
        <a href="Login.jsp">Already have account? <br>Click here to login...</a>
    </form>
</div>


</body>
</html>
