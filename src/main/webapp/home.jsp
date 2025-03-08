<%@page import="edu.jsp.dao.UserDao"%>
<%@page import="edu.jsp.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="edu.jsp.entity.User"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Expense Tracker</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
        integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Exo+2:ital,wght@0,100..900;1,100..900&display=swap"
        rel="stylesheet">
	
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 100vh;
            width: 100vw;
            overflow-x: hidden;
        }

        .profile {
            top: 2vh;
            position: absolute;
            width: 23%;
            color: white;
        }

        .profile>button {
            position: absolute;
            top: 3vh;
            left: 2vh;
            z-index: 10;
            font-size: 2.4rem;
            background: #6664c0;
            outline: none;
            border-radius: 50%;
            padding: 1rem;
            height: 10vh;
            width: 10vh;
            display: flex;
            justify-content: center;
            align-items: center;
            border: 5px double #4CAF50;
            /* border-style: dashed ; */
        }

        .profile>button:hover {
            font-size: 2rem;
            transition: .3s;
        }

        #profile-container {
            /* height: 60vh; */
            width: 100%;
            /* background: black; */
            backdrop-filter: blur(20px);
            position: absolute;
            border-radius: 0 1rem 1rem 0;
            box-shadow: 2px 5px 10px grey;
            display: none;
            flex-direction: column;
            align-items: center;
            overflow: hidden;
            padding: 1rem;
            animation: slide-right .5s;
        }

        #profile-container h3,
        #profile-container h2 {
            width: 100%;
            padding: 1.2rem;
            border-bottom: 2px dashed white;
            text-align: center;
        }

        #profile-container h2 {
            padding: 0 0rem 1rem 1rem;
            margin-top: 0;
            text-align: left;
        }

        #profile-container h2 span {
            font-size: .9rem;
            font-weight: 300;
        }
        #profile-container .total-expenses{
            width: 100%;
            display: flex;
            justify-content: center;
            padding: 1rem;
        }
        .container {
            display: flex;
            width: 100%;
            height: 100%;
            background: url("https://miro.medium.com/v2/resize:fit:750/1*yTcKfAJwkQ2OyLp9YG3_4Q.jpeg");
            background-repeat: no-repeat;
            background-size: cover;
            align-items: center;
            justify-content: space-between;
        }

        .left {
            flex: 1;
            padding: 5rem;
            padding-top: 0;
            display: flex;
            flex-direction: column;
            justify-content: flex-start;
            align-items: center;
            font-size: 3rem;
            font-weight: 700;
            color: #f3f3f3;
            font-family: "Exo 2", sans-serif;
            /* gap: 6rem; */
            height: 80%;
            cursor: default;
        }

        .left h3 {
            font-weight: 600;
            text-align: right;
        }

        .buttons {
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            width: 30%;
            background: #1f1e41;
            height: 50%;
            gap: 2rem;
            border-radius: 2rem;
            border: 10px solid #4CAF50;
            border-style: double none;
        }

        .buttons a {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 50%;
            text-decoration: none;
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

        .aside {
            display: flex;
            flex-direction: column;
            justify-content: center;
            width: 19%;
            background: #6664c0;
            height: 40%;
            padding: 2rem;
            border-radius: 1rem 0 0 1rem;
            box-shadow: -8px 0px 20px rgb(46, 44, 44);
            color: #f0eeee;
        }

        .content {
            flex: 1;
            padding-right: 20px;
        }

        .content ul {
            list-style-type: disc;
            padding-left: 20px;
        }

        .content ul li {
            margin-bottom: 10px;
        }

        #profile-container button {
            width: 75%;
        }
        #expenses ,#updateProfile,#feedback{
            position: absolute;
            width: 100%;
            height: 100%;
            backdrop-filter: blur(10px);
            top: 50%;
            left: 50%;
            transform: translate(-50%,-50%);
            display: none;
            align-items: center;
            justify-content: center;
            z-index: 11;
        }
        #expenses-container,#update-form-container,#feedback-container{
            height: 50%;
            width: 20%;
            background: white;
            border-radius: 2rem;
            border: 10px solid #4CAF50;
            border-style: double none;
            position: relative;
            overflow: hidden;
            animation: popup .5s;
            display: flex;
            flex-direction: column;
            justify-content:center;
            gap: 0;
            align-items: center;
            background: rgb(8, 8, 8);
            transition: .4s;
        }
        #expenses-container h3:hover{
            background: rgb(36, 34, 34);
            font-size: 1.5rem;
            transition: .4s;
            color: white;
        }
        #expenses-container h3{
            font-weight: 300;
            width: 100%;
            text-align: center;
            padding: 1rem;
            margin: 0;
            cursor: pointer;
            color: rgb(66, 66, 66);
        }
        #expenses-container h3>span{
            display: block;
            width: 100%;
            text-align: center;
            color: rebeccapurple;
            font-weight: 800;
        }
        .close-btn{
            width: 15%;
            position: absolute;
            top: -5px;
            right: 0px;
            border-radius:0 0 0 5px;
        }
        #update-form-container{
            height: 70%;
            width: 30%;
            padding: 2rem;
        }
        label {
            display: block;
            margin: 10px 0 5px;
            color: white;
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
        
        
        
        /* FEEDBACK FORM SECTION */
        #feedback {
            color: white;
        }

        #feedback-container {
            height: 80%;
            width: 30%;
            gap: 2rem;
        }

        #feedback-container button {
            width: 60%;
        }

        .stars {
            display: flex;
            flex-direction: row-reverse;
            justify-content: center;
            margin-bottom: 1rem;
            gap: 1rem;
        }

        .stars input {
            display: none;
        }

        .stars label {
            font-size: 30px;
            color: #ccc;
            cursor: pointer;
            transition: color 0.2s ease-in-out;
        }

        .stars input:checked~label,
        .stars input:hover~label {
            color: #f7d106;
            scale: 1.5;
        }

        .stars input:hover~label:nth-child(-n+var(--star-hovered)) {
            color: #f7d106;
        }

        #feedbackMessage {
            display: none;
            margin-top: 20px;
            font-size: 18px;
            font-weight: bold;
        }
        
        
        
        
        @keyframes popup {
            from{
                scale: 0.0;
            }
            to{
                scale: 1;
            }
        }
        @keyframes slide-right {
            from{
                translate:-100% 0;
            }
            to{
                translate: 0 0;
            }
        }
    </style>
    <link rel="stylesheet" href="responsive.css" />

</head>

<body>
    <%
	User currentUser = (User) session.getAttribute("currentUser");
    UserDao dao=new UserDao();
	%>
	<%
		if (currentUser != null) {
			String name=currentUser.getName();
			String email=currentUser.getEmail();			
			Long mobile=currentUser.getMobile();
		%>

    <div class="profile">
        <button onclick="showProfile()" class="profile-icon"><i class="fa-solid fa-user"></i></button>
        <div id="profile-container">
            <h3><%=name %></h3>
            <h2><i class="fa-solid fa-envelope"></i> &nbsp; <span><%=email%></span></h2>
            <h2><i class="fa-solid fa-mobile fa-shake"></i> &nbsp; <span><%=mobile%></span></h2>
            <div class="total-expenses">
                <button onclick="displayExpenses()" title="Display total expenses">Total expenses</button>
            </div>
            <button onclick="displayForm()">Update Profile</button>
            <br>
            <button onclick="displayFeedback()">Speak Your Thoughts</button>
        </div>
    </div>
    <div id="expenses">
        <div id="expenses-container">
            <button class="close-btn" onclick="hideExpenses()" title="Close">X</button>
            
            <h3>Total <br> <span><%=dao.totalExpenses(currentUser)%></span></h3>
            <h3>Last Month <br> <span><%=dao.lastMonthExpenses(currentUser)%></span></h3>
            <h3>Last Week <br> <span><%=dao.lastWeekExpenses(currentUser)%></span></h3>
        </div>
    </div>
    <div id="updateProfile">
        <div id="update-form-container">
            <button onclick="hideForm()" class="close-btn" title="Close">X</button>
            <form id="registerForm" action="updateUserInfo" method="post">
                
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required value=<%=currentUser.getName() %>>
                <label for="name">Email:</label>
                <input type="email" id="email" name="email" required value=<%=currentUser.getEmail() %>>
                
                <label for="mobile">Mobile:</label>
                <input type="number" id="mobile" name="mobile" required value=<%=currentUser.getMobile()%>> 

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" minlength="3" maxlength="5" required value=<%=currentUser.getPassword() %>>  
                
                <button onclick="hideForm()" title="Close">Submit</button>
            </form>
        </div>
    </div>
   	<div id="feedback">
        <div id="feedback-container">
            <h2>Customer Feedback</h2>
			<button onclick="hideFeedback()" class="close-btn" title="Close">X</button>
            <!-- Star Rating Section -->
            <div class="stars">
                <input type="radio" id="star5" name="rating" value="5">
                <label for="star5" title="5 stars">&#9733;</label>

                <input type="radio" id="star4" name="rating" value="4">
                <label for="star4" title="4 stars">&#9733;</label>

                <input type="radio" id="star3" name="rating" value="3">
                <label for="star3" title="3 stars">&#9733;</label>

                <input type="radio" id="star2" name="rating" value="2">
                <label for="star2" title="2 stars">&#9733;</label>

                <input type="radio" id="star1" name="rating" value="1">
                <label for="star1" title="1 star">&#9733;</label>
            </div>

            <!-- Feedback Text Area -->
            <textarea id="feedbackText" placeholder="Write your feedback here..." rows="10" cols="30"></textarea>

            <!-- Submit Button -->
            	<a id="feedback-data-transfer"><button type="submit" onclick="submitFeedback()">Submit</button></a>

            <!-- Feedback Message -->
            <div id="feedbackMessage"></div>
        </div>
    </div>
   
    <%} %>
    
    <div class="container">
        <div class="left">
            <h3>Welcome
                <%
		if (currentUser != null) {
		%>
			<%=currentUser.getName()%>
			<%
			}
			%>
                To Expense Tracker
            </h3>

            <div class="buttons" id="buttons">
                
                <%
				if (currentUser == null) {
				%>
                <a href="Login.jsp"><button>Login</button></a> <a href="Register.jsp"><button>Register</button></a>
                <%
            }
            %>
            <%
            if (currentUser != null) {
            %>
            <a href="logout"><button>Logout</button></a> <a href="showexpenses">
                <button>Show Expenses</button>
            </a>
            <%
            }
            %>
            </div>
        </div>
        <aside class="aside">
            <div class="content">
                <h3>Why Use Expense Tracker?</h3>
                <ul>
                    <li>Track your daily, weekly, and monthly expenses
                        effortlessly.</li>
                    <li>Analyze your spending habits.</li>
                    <li>Set budgets to control unnecessary expenses.</li>
                    <li>Stay informed about your savings and expenses in
                        real-time.</li>
                    <li>Improve financial management.</li>
                </ul>
            </div>

        </aside>
    </div>

    

   <script>
        function showProfile() {
            var x = document.getElementById("profile-container");
            var btn = document.getElementById("buttons");
            if (x.style.display === "none") {
                x.style.display = "flex";
                x.style.animation = "slide-right .5s"
                btn.style.zIndex= "-1";
            } else {
                x.style.display = "none";
                btn.style.zIndex= "10";
            }
        }
        function displayExpenses() {
            var x = document.getElementById("expenses");
            x.style.display = "flex";
        }
        function hideExpenses() {
            var x = document.getElementById("expenses");
            x.style.display = "none";
        }
        function displayForm() {
            var x = document.getElementById("updateProfile");
            x.style.display = "flex";
        }
        function hideForm() {
            var x = document.getElementById("updateProfile");
            x.style.display = "none";
        }
        function displayFeedback() {
            var x = document.getElementById("feedback");
            x.style.display = "flex";
        }
        function hideFeedback() {
            var x = document.getElementById("feedback");
            x.style.display = "none";
        }

        let selectedRating = 0;

        // Detect rating selection
        document.querySelectorAll('.stars input').forEach((input) => {
            input.addEventListener('change', (event) => {
                selectedRating = event.target.value;
            });
        });

        // Submit feedback function
        function submitFeedback() {
            const feedbackText = document.getElementById('feedbackText').value;
            const feedbackMessage = document.getElementById('feedbackMessage');
            const feedbackTransferLink = document.getElementById('feedback-data-transfer');

            // Show message based on rating
            if (selectedRating == 5) {
                feedbackMessage.textContent = 'Thank you! We hope you will keep visiting.';
            } else if (selectedRating == 1) {
                feedbackMessage.textContent = 'Oops, sorry for the inconvenience!';
            } else if (selectedRating == 0) {
                feedbackMessage.textContent = 'Please select a star rating before submitting!';
                feedbackMessage.style.color = 'red';
            } else {
                feedbackMessage.textContent = `Thank you for your ${selectedRating}-star rating!`;
            }

            // Show feedback message
            feedbackMessage.style.display = 'block';
            
            feedbackTransferLink.href = `addFeedback?message=${feedbackText}&rating=${selectedRating}`;
        }
    </script>

</body>

</html>