<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add User Page</title>
<style>
    body {
        font-family: 'Poppins', sans-serif;
        background: linear-gradient(135deg, #141e30, #243b55);
        color: #fff;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .form-container {
        background: #1f2739;
        padding: 40px 30px;
        border-radius: 12px;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
        text-align: center;
        width: 100%;
        max-width: 360px;
        position: relative;
    }

    .form-container::before {
        content: '';
        width: 60px;
        height: 60px;
        background: linear-gradient(135deg, #53a0fd, #6376ff);
        border-radius: 50%;
        position: absolute;
        top: -30px;
        left: 50%;
        transform: translateX(-50%);
    }

    h2 {
        margin: 20px 0;
        font-size: 22px;
        color: #a6b9f9;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    form {
        margin-top: 20px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"] {
        width: 100%;
        padding: 12px 15px;
        margin-bottom: 20px;
        border: none;
        border-radius: 8px;
        background: #2a3546;
        color: #fff;
        font-size: 14px;
        box-sizing: border-box;
        transition: background 0.3s ease;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus {
        background: #36475c;
        outline: none;
    }

    input::placeholder {
        color: #aaa;
        font-style: italic;
    }

    input[type="submit"] {
        background: linear-gradient(135deg, #53a0fd, #6376ff);
        color: #fff;
        border: none;
        padding: 15px;
        border-radius: 8px;
        font-size: 16px;
        font-weight: bold;
        cursor: pointer;
        width: 100%;
        transition: transform 0.3s, box-shadow 0.3s;
    }

    input[type="submit"]:hover {
        transform: translateY(-2px);
        box-shadow: 0 5px 15px rgba(83, 160, 253, 0.5);
    }

    .form-container p {
        margin-top: 15px;
        font-size: 14px;
        color: #bbb;
    }

    .form-container p a {
        color: #53a0fd;
        text-decoration: none;
        font-weight: bold;
    }

    .form-container p a:hover {
        text-decoration: underline;
    }

    h1 {
        color: #ff6b6b;
        font-size: 18px;
        margin-top: 20px;
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
    

</style>
</head>
<body>
    <div class="form-container">
        <h2>SIGN UP</h2>
        <form action="./add-user" method="post">
            <input type="text" name="username" placeholder="Enter your username">
            <input type="email" name="email" placeholder="Enter your email">
            <input type="text" name="mobile" placeholder="Enter your mobile number">
            <input type="password" name="password" placeholder="Enter your password">
            <input type="submit" value="Sign Up">
        </form>
        <p>Already have an account? <a href="./login-page">Log in</a></p>
    </div>
    <div class="message">
    <%
	String message = (String) request.getAttribute("message");
	if (message != null) {
	%>
	<h1><%=message%>
	</h1>
	<%
	}
	%>
	</div>
</body>
</html>
