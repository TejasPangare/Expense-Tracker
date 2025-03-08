<%@page import="edu.jsp.entity.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Expense</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
	integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
	crossorigin="anonymous" referrerpolicy="no-referrer">

<style>
body {
	font-family: Arial, sans-serif;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
	background: url("https://images6.alphacoders.com/133/1335123.png");
	background-repeat: no-repeat;
	background-size: cover;
}

.expense-container {
	background-color: #1f1e41;
	padding: 30px;
	border-radius: 10px;
	width: 400px;
	box-shadow: 0px 0px 20px rgb(46, 44, 44);
	border: 15px solid black;
	border-style: double none;
	color:#ffff;
}

h2 {
	text-align: center;
	margin-bottom: 20px;
}

label {
	display: block;
	margin: 10px 0 5px;
}

input[type="text"], input[type="number"], input[type="date"], select {
	width: 100%;
	padding: 10px;
	margin: 5px 0 15px;
	border: 1px solid #ccc;
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

.home-logout {
	position: absolute;
	top: 2rem;
	left: 2rem;
	display: flex;
	gap: 1rem;
}
</style>
</head>
<body>
	<div class="home-logout">
		<a
			href="home.jsp?currentUser=<%=session.getAttribute("currentUser")%>"><button
				title="Home">
				<i class="fa-solid fa-house fa-bounce"></i>
			</button></a> <a href="logout"><button title="Logout">
				<i class="fa-solid fa-right-from-bracket fa-bounce"></i>
			</button></a>
	</div>
	<div class="expense-container">
		<%
		Expense expense = (Expense) request.getAttribute("expense");
		%>
		<h2>Update Expense</h2>
		<form id="expenseForm" action="updateexpense">

			<label for="id">Expense Id:</label> <input type="number" name="id"
				required value=<%=expense.getExpenseId()%> readonly> <label
				for="amount">Amount (₹):</label> <input type="number" id="amount"
				name="amount" min="0" step="0.01" required
				value=<%=expense.getAmount()%>> <label for="category">Category:</label>
			<select id="category" name="category" required>
				<option value="" disabled selected><%=expense.getDescription()%></option>
				<option value="Food">Food</option>
				<option value="Transport">Transport</option>
				<option value="Entertainment">Entertainment</option>
				<option value="Bills">Bills</option>
				<option value="Other">Other</option>
			</select> <label for="date">Date:</label> <input type="date" id="date"
				name="date" required value=<%=expense.getDateTime()%>>

			<button type="submit">Update Expense</button>
		</form>
	</div>


</body>
</html>
