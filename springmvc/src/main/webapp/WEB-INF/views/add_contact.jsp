<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Contact Page</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet">
  <style>
    body {
      background-color: #f8f9fa;
      height: 100%;
    }

    .form-container {
      background-color: #fff;
      border-radius: 8px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 600px;
      margin: 50px auto;
      padding: 30px;
      height: 100%;
    }

    .form-container h2 {
      text-align: center;
      color: #343a40;
      margin-bottom: 20px;
    }

    .form-container table {
      width: 100%;
    }

    .form-container td {
      padding: 10px;
    }

    .form-container input[type="text"], 
    .form-container input[type="email"], 
    .form-container input[type="date"],
    .form-container input[type="radio"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 5px;
      font-size: 1rem;
    }

    .form-container input[type="radio"] {
      width: auto;
      margin-right: 10px;
    }

    .form-container .btn {
      background-color: #343a40;
      color: #fff;
      border: none;
      padding: 10px 20px;
      border-radius: 5px;
      font-size: 1.1rem;
      width: 100%;
      cursor: pointer;
    }

    .form-container .btn:hover {
      background-color: #495057;
    }

    .form-container label {
      color: #343a40;
    }

    .form-container input[type="submit"]:hover {
      background-color: #495057;
    }

    .form-container .button-container {
      display: flex;
      justify-content: space-between;
      margin-top: 20px;
      gap:5px;
    }

    .form-container .button-container .btn-home {
      background-color: #007bff;
      width: auto;
      padding: 5px 15px;
    }

    .form-container .button-container .btn-home:hover {
      background-color: #0056b3;
    }

    /* Responsive Design */
    @media (max-width: 576px) {
      .form-container {
        padding: 10px;
      }

      .form-container h2 {
        font-size: 1.5rem;
      }
    }
  </style>
</head>
<body>

  <div class="form-container">
    <h2>Add Contact</h2>
    <form action="./add-contact" method="post">
      <table>
        <tr>
          <td><label for="first_name">First Name</label></td>
          <td><input type="text" id="first_name" name="first_name" required></td>
        </tr>
        <tr>
          <td><label for="last_name">Last Name</label></td>
          <td><input type="text" id="last_name" name="last_name" required></td>
        </tr>
        <tr>
          <td><label for="email">Email</label></td>
          <td><input type="email" id="email" name="email" required></td>
        </tr>
        <tr>
          <td><label for="mobile">Mobile</label></td>
          <td><input type="text" id="mobile" name="mobile" required></td>
        </tr>
        <tr>
          <td><label for="work">Work</label></td>
          <td><input type="text" id="work" name="work" required></td>
        </tr>
        <tr>
          <td><label>Gender</label></td>
          <td>
            <input type="radio" name="gender" value="MALE" required><label for="male">Male</label>
            <input type="radio" name="gender" value="FEMALE" required><label for="female">Female</label>
            <input type="radio" name="gender" value="OTHERS" required><label for="others">Others</label>
          </td>
        </tr>
        <tr>
          <td><label for="dob">Date of Birth</label></td>
          <td><input type="date" id="dob" name="dob" required></td>
        </tr>
        <tr>
          <td><label for="address">Address</label></td>
          <td><input type="text" id="address" name="address" required></td>
        </tr>
        <tr>
          <td><label for="website">Website</label></td>
          <td><input type="text" id="website" name="website" required></td>
        </tr>
      </table>
      
      <div class="button-container">
        <input type="submit" value="Add Contact" class="btn">
        <a href="./home" class="btn">Home</a> <!-- Assuming '/' is the home page link -->
      </div>
    </form>
  </div>

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
