<%@page import="com.ruturaj.springmvc.dto.UserDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Page</title>
<style>
    /* General Styling */
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #121212;
        color: #ffffff;
        margin: 0;
        padding: 0;
    }
    h1 {
        text-align: center;
        color: #00adb5;
        margin-top: 20px;
        text-shadow: 2px 2px 5px #000000;
    }
    .container {
        margin: 30px auto;
        width: 90%;
        max-width: 1200px;
    }

    /* Table Styling */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #1e1e2f;
        border-radius: 10px;
        overflow: hidden;
    }
    table th, table td {
        padding: 15px;
        text-align: center;
        border-bottom: 1px solid #333;
    }
    table th {
        background-color: #00adb5;
        color: #ffffff;
        text-transform: uppercase;
        font-size: 14px;
    }
    table tr {
        transition: all 0.2s ease-in-out;
    }
    table tr:hover {
        background-color: #393e46;
        transform: scale(1.02);
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.5);
    }
    table td {
        font-size: 14px;
        color: #e6e6e6;
    }

    /* Action Links */
    a {
        text-decoration: none;
        color: #00adb5;
        font-weight: bold;
        padding: 8px 12px;
        border: 2px solid #00adb5;
        border-radius: 5px;
        transition: all 0.3s ease-in-out;
    }
    a:hover {
        background-color: #00adb5;
        color: #ffffff;
        transform: translateY(-2px);
    }
    
    .btn{
    	display: flex;
    	align-items: center;
    	justify-content: center;
    	
    }
	
	.message {
    text-align: center;
    margin-top: 20px;
    font-size: 16px;
    color: #ff6b6b; /* Error or alert color */
    font-weight: bold;
	}

	.message h1 {
    font-size: 18px;
    margin: 0;
    padding: 10px;
    background: rgba(255, 107, 107, 0.1); /* Light background for the message */
    border: 1px solid #ff6b6b;
    border-radius: 8px;
    display: inline-block;
	}
	
/* Fade-in Animation */
@keyframes fadeIn {
    0% {
        opacity: 0;
    }
    100% {
        opacity: 1;
    }
}

/* Slide-in Animation */
@keyframes slideIn {
    0% {
        transform: translateY(-30px);
    }
    100% {
        transform: translateY(0);
    }
}
	

	
    
 
</style>
</head>
<body>
    <%
    @SuppressWarnings("unchecked")
    List<UserDTO> users = (List<UserDTO>) request.getAttribute("users");
    if (users != null) {
    %>
    <div class="container">
        <table>
            <tr>
                <th>User Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Password</th>
                <th colspan="2">Action</th>
            </tr>
            <%
            for (UserDTO user : users) {
            %>
            <tr>
                <td><%=user.getName()%></td>
                <td><%=user.getEmail()%></td>
                <td><%=user.getMobile()%></td>
                <td><%=user.getPassword()%></td>
                <td><a href="./edit-user?id=<%=user.getId()%>">Edit</a></td>
                <td><a href="./delete-user?id=<%=user.getId()%>">Delete</a></td>
             </tr>
            <%
            }
            %>
        </table>
        <div class="btn">
        <a href="./home">Back To Home Page</a>
        </div>
    </div>
    <%
    }
    String message = (String) request.getAttribute("message");
    if (message != null) {
    %>
    <div class="message">
    <%=message%>
    </div>
    <%
    }
    %>
</body>
</html>
