<%@page import="com.ruturaj.springmvc.dto.UserDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit User page</title>
<style>
body {
    font-family: Arial, sans-serif;
    background-color: #f8f9fa; /* Light background */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

.form-container {
    background: #ffffff; /* Form background */
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    padding: 25px 35px;
    width: 400px;
}

.form-container h2 {
    text-align: center;
    margin-bottom: 20px;
    color: #343a40; /* Dark heading color */
}

table {
    width: 100%;
    border-spacing: 10px;
}

td {
    color: #343a40; /* Dark text color for better contrast */
    font-size: 14px;
    vertical-align: middle;
}

input[type="text"], input[type="email"], input[type="password"], input[type="radio"],
input[type="submit"] {
    width: 100%;
    padding: 10px;
    border: 1px solid #ced4da; /* Neutral border color */
    border-radius: 4px;
    font-size: 14px;
    margin-top: 5px;
    box-sizing: border-box;
}

input[type="radio"] {
    width: auto;
}

label {
    margin-left: 5px;
    font-size: 14px;
    vertical-align: middle;
}

input[type="submit"] {
    background-color: #343a40; /* Primary button color */
    color: #f8f9fa; /* Button text color */
    border: none;
    cursor: pointer;
    transition: background-color 0.3s ease;
}

input[type="submit"]:hover {
    background-color: #495057; /* Slightly lighter dark shade for hover */
}

tr td:first-child {
    width: 30%;
    font-weight: bold;
    vertical-align: middle;
}

tr td:last-child {
    width: 70%;
}

.form-container div {
    text-align: center;
    margin-top: 20px;
}
</style>

</head>
<body>
	<%
	UserDTO user =(UserDTO)request.getAttribute("user");
	%>
	<div class="form-container">
		<h2>User Details</h2>
		<form action="./update-user" method="post">
			<table>
				<tr>
					<td>Id</td>
					<td><input type="text" name="id" value="<%=user.getId()%>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<td>User Name</td>
					<td><input type="text" name="name"
						value="<%=user.getName()%>"></td>
				</tr>
				<tr>
					<td>Email</td>
					<td><input type="email" name="email"
						value="<%=user.getEmail()%>"></td>
				</tr>
				<tr>
					<td>Mobile</td>
					<td><input type="text" name="mobile"
						value="<%=user.getMobile()%>"></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password"
						value="<%=user.getPassword()%>"></td>
				</tr>
			</table>
			<div>
				<input type="submit" value="UPDATE">
			</div>
		</form>
	</div>
</body>
</html>