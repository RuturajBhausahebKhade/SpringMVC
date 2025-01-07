<%@page import="com.ruturaj.springmvc.dto.ContactDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contacts</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #eef2f3;
            font-family: 'Verdana', sans-serif;
        }

        .container {
            margin-top: 50px;
            background-color: #ffffff;
            border-radius: 12px;
            padding: 20px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #333333;
            margin-bottom: 30px;
            font-size: 28px;
            text-align: center;
        }

        .table-container {
            overflow-x: auto; /* Add horizontal scroll for smaller screens */
        }

        .table th {
            background-color: #343a40;
            color: white;
            text-align: center;
        }

        .table td {
            text-align: center;
        }

        .table tbody tr:hover {
            background-color: #f8f9fa;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .btn {
            padding: 6px 12px;
            font-size: 14px;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .btn-edit {
            background-color: #343a40;
            color: white;
            border: none;
        }

        .btn-edit:hover {
            background-color: white;
            color:#343a40;
            border: 1px solid;
        }

        .btn-delete {
            background-color: #343a40;
            color: white;
            border: none;
        }

        .btn-delete:hover {
             background-color: white;
            color:#343a40;
            border: 1px solid;
        }

        .btn-container a {
            display: inline-block;
            text-decoration: none;
            font-size: 16px;
            padding: 8px 15px;
            background-color: #343a40;
            color: white;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        .btn-container a:hover {
            background-color: white;
            color:#343a40;
            transform: scale(1.05);
            border: 1px solid;
        }

        .message {
            background-color: #f8d7da;
            color: #842029;
            padding: 15px;
            text-align: center;
            border: 1px solid #f5c2c7;
            border-radius: 8px;
            margin-top: 20px;
        }
        
        
    </style>
</head>
<body>
    <%
    @SuppressWarnings("unchecked")
    List<ContactDTO> contacts = (List<ContactDTO>) request.getAttribute("contacts");
    if (contacts != null) {
    %>
    <div class="container">
        <h1>Contacts</h1>
        <div class="table-container">
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Email</th>
                        <th>Mobile</th>
                        <th>Work</th>
                        <th>Gender</th>
                        <th>DOB</th>
                        <th>Address</th>
                        <th>Website</th>
                        <th colspan="2">Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                    for (ContactDTO contact : contacts) {
                    %>
                    <tr>
                        <td><%=contact.getFirstName()%></td>
                        <td><%=contact.getLastName()%></td>
                        <td><%=contact.getEmail()%></td>
                        <td><%=contact.getMobile()%></td>
                        <td><%=contact.getWork()%></td>
                        <td><%=contact.getGender()%></td>
                        <td><%=contact.getDob()%></td>
                        <td><%=contact.getAddress()%></td>
                        <td><%=contact.getWebsite()%></td>
                        <td><a href="./edit-contact?id=<%=contact.getId()%>" class="btn btn-edit">Edit</a></td>
                        <td><a href="./delete-contact?id=<%=contact.getId()%>" class="btn btn-delete">Delete</a></td>
                    </tr>
                    <%
                    }
                    %>
                </tbody>
            </table>
        </div>
        <div class="btn-container text-center">
            <a href="./home">Back To Home Page</a>
        </div>
    </div>
    <%
    }
    String message = (String) request.getAttribute("message");
    if (message != null) {
    %>
    <div class="container">
        <div class="message">
            <%=message%>
        </div>
    </div>
    <%
    }
    %>
    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
