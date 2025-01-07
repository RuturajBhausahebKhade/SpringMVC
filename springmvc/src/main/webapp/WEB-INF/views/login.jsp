<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<style>
body {
    font-family: 'Poppins', sans-serif;
    background-color: #343a40; /* Dark background */
    margin: 0;
    padding: 0;
    height: 100vh;
    width: 100%;
    
}

.main {
	width:100%;
	height:100vh;
    display: flex;
    align-items: center;
    justify-content: center;
    position: relative;
}

.form-container {
    background: #f8f9fa; /* Light form background */
    width: 400px;
    padding: 30px;
    border-radius: 10px;
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
    position: relative;
    text-align: center;
}

.form-container::before {
    content: '';
    position: absolute;
    top: -40px;
    left: 50%;
    transform: translateX(-50%);
    background: #343a40; /* Dark icon background */
    width: 80px;
    height: 80px;
    border-radius: 50%;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
    background-image: url('https://cdn-icons-png.flaticon.com/512/3135/3135715.png'); /* Placeholder icon */
    background-size: cover;
    background-position: center;
}

h2 {
    color: #343a40; /* Dark text color */
    font-size: 24px;
    margin: 20px 0;
}

form {
    margin: 20px 0;
}

input[type="email"],
input[type="password"] {
    width: 100%;
    padding: 12px;
    margin-bottom: 15px;
    border: 1px solid #ced4da; /* Neutral border color */
    border-radius: 5px;
    box-sizing: border-box;
    font-size: 14px;
    background: #fff; /* White input background */
    color: #343a40; /* Dark text */
}

input[type="submit"] {
    width: 100%;
    padding: 12px;
    border: none;
    border-radius: 5px;
    background: #343a40; /* Primary button color */
    color: #f8f9fa; /* Button text color */
    font-size: 16px;
    font-weight: bold;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background: #495057; /* Slightly lighter dark shade */
}

.form-container a {
    color: #343a40; /* Link color */
    text-decoration: none;
    font-size: 14px;
}

.form-container a:hover {
    text-decoration: underline;
}


.message {
    text-align: center;
    position: relative;
    top: 220px;
    font-size: 16px;
    color: #495057; /* Medium-dark text color */
    font-weight: bold;
}

.message h1 {
    font-size: 18px;
    margin: 0;
    padding: 10px;
    background: #f8f9fa; /* Light background */
    border: 1px solid #495057; /* Medium-dark border */
    border-radius: 8px;
    display: inline-block;
}
</style>

</head>
<body>
	<div class="main">
    <div class="form-container">
        <h2>My Account</h2>
        <form action="./auth-user" method="post">
            <input type="email" name="email" placeholder="Email Id">
            <input type="password" name="password" placeholder="Password">
            <div style="text-align: right; margin-bottom: 15px;">
                <a href="#">Forgot Password?</a>
            </div>
            <input type="submit" value="Login">
        </form>
    </div>
    </div>
    <div class="message">
    <%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h1><%=message%></h1>
	<%
	}
	%>
	</div>
</body>
</html>
