<%@page import="edu.jsp.entity.User"%>
<%@page import="java.util.List"%>
<%@page import="edu.jsp.dao.ExpenseDao"%>
<%@page import="edu.jsp.entity.Expense"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense List</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css" integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg==" crossorigin="anonymous" referrerpolicy="no-referrer" />    
    <style>
    *{
    	margin: 0;
    	padding: 0;
    	box-sizing: border-box;
    }
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            background: url("https://t3.ftcdn.net/jpg/09/65/57/44/240_F_965574405_n69Qcl9uJYzQ1O2DyamvUGReKVs9fGwD.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            width:100vw;
            overflow-x:hidden 
        }
        h1 {
            margin-bottom: 20px;
            color : #ffff;
        }
        table {
            width: 80%;
            border-collapse: collapse;
            background-color: #1f1e41;
            color:white;
            box-shadow: 0px 0px 20px rgb(46, 44, 44);
            overflow : hidden;
            border: 15px solid black;
            border-style: double none;
        }
        th, td {
            padding: 15px;
            text-align: left;
        }
        th {
            background-color: #4CAF50;
            color: white;
        }
        tr:hover {
            background-color: #1f1e13;
            transition : .2s;
        }
        td {
            font-size: 1rem;
        }
        .buttons{
        	display: flex;
            align-items: center;
            height: 50%;
            gap: 1rem;
        }
        .buttons a {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50%;
            text-decoration: none;
        }
        button{
            padding: 10px;
            font-size: 1rem;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        .home-logout{
            position: absolute;
            top: 2rem;
            left: 2rem;
            display: flex;
            gap: 1rem;
        }
        .bottom{
            padding: .5rem;
            width: 60%;
            /* border: 2px solid black; */
            display: flex;
            justify-content: space-between;
        }
        .bottom button{
            font-size: small;
            font-weight: 700;
        }
        input,select{
            outline: none;
            border: none;
            background: #4CAF50;
            padding: .5rem;
            color: white;
            font-size: medium;
        }
        .options{
            display: flex;
            width: 100%;
            align-items: center;
            justify-content: center;
            gap: 10px;
        }
        .options a{
            color: white;
            background: #525252;
            text-decoration: none;
            padding: 5px 10px;
            margin-top: 5px;
            font-weight: 200;
        }
        .options a:hover{
           background: #313131;
           transition: .3s;
        }
        button:hover {
            background-color: #419244;
            transition: .3s;
        }
    </style>
	<link rel="stylesheet" href="expensesresponsive.css" />    
	
</head>
<body>
<div class="home-logout">
        <a href="home.jsp"><button title="Home"><i class="fa-solid fa-house fa-bounce"></i></button></a>
        <a href="logout"><button title="Logout"><i class="fa-solid fa-right-from-bracket fa-bounce"></i></button></a>
    </div>
<h1>Your Expenses</h1>
<% 
	User currentUser = (User)session.getAttribute("currentUser");
	List<Expense> expenses=(List<Expense>)request.getAttribute("expenses");
%>
<table id="expensesTable">
    <thead>
        <tr>
            <th>Expense Id</th>
            <th>Date</th>
            <th>Amount (₹)</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
      <%
      for(Expense expense : expenses){%>
        <tr>
            <td><%=expense.getExpenseId() %></td>
            <td><%=expense.getDateTime() %></td>
            <td><%=expense.getAmount() %></td>
            <td><%=expense.getDescription() %></td>
            <td class="buttons">
            <a href="updatee?expenseId=<%=expense.getExpenseId()%>"><button>Update</button> </a>
            <a href="removeexpense?expenseId=<%=expense.getExpenseId()%>"><button>Remove</button> </a></td>
        </tr>
        <%} %>
        <tr> <form action="addexpense">
        	<td></td>
        	<td><input type="date" id="date" name="date" required></td>
        	<td> <input type="number" id="amount" name="amount" min="0" step="0.01" required> </td>
        	<td><select id="category" name="category" required>
            <option value="" disabled selected>Select a category</option>
            <option value="Food">Food</option>
            <option value="Transport">Transport</option>
            <option value="Entertainment">Entertainment</option>
            <option value="Bills">Bills</option>
            <option value="Other">Other</option>
        </select></td>
        	<td><button type="submit"><i class="fa-solid fa-circle-plus" style="color: #2a5548;"></i></button></td>
        	</form>
        </tr>
    </tbody>
</table>

<div class="bottom">
            <button disabled>GET EXPENSES FOR <br>
                <div class="options">
                    <a href="getThisMonthExpenses">
                        Last Month
                    </a><a href="getThisWeekExpenses">
                        Last Week
                    </a>
                </div>
            </button>
        <a href="sortByDate"><button>SORT BY DATE</button></a>
        <a href="sortByAmount"><button>SORT BY AMOUNT</button></a>
    </div>

</body>
</html>
