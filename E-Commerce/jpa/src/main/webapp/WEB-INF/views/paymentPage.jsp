<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.example.jpa.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="ISO-8859-1">
  <title>Pay with Razorpay</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">

  <style>
    body {
      margin: 0;
      padding: 0;
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(to right, #e0f7fa, #fff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }

    form {
      background-color: #ffffff;
      padding: 40px;
      border-radius: 15px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 450px;
    }

    h2 {
      text-align: center;
      margin-bottom: 30px;
      color: #00796b;
    }

    label {
      display: block;
      margin-bottom: 6px;
      font-weight: 500;
      color: #37474f;
    }

    input {
      width: 100%;
      padding: 10px 12px;
      margin-bottom: 20px;
      border: 1px solid #b0bec5;
      border-radius: 8px;
      font-size: 16px;
      transition: border-color 0.3s ease;
    }

    input:focus {
      border-color: #26a69a;
      outline: none;
    }

    button {
      width: 100%;
      padding: 12px;
      background-color: #00796b;
      color: white;
      font-size: 16px;
      font-weight: bold;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #004d40;
    }
  </style>
</head>
<body>

<%
    User user = (User) request.getAttribute("user");
    String price = (String) request.getAttribute("price");
%>

<form action="/createOrder" method="post">
  <h2>Pay with Razorpay</h2>

  <label for="amount">Amount</label>
  <input type="number" name="amount" id="amount" value="<%= price %>" readonly />

  <label for="name">Name</label>
  <input type="text" name="name" id="name" value="<%= user.getName() %>" required />

  <label for="email">Email</label>
  <input type="email" name="email" id="email" value="<%= user.getEmail() %>" required />

  <label for="contact">Contact</label>
  <input type="text" name="contact" id="contact" value="<%= user.getPhno() %>" required />

  <button type="submit">Pay Now</button>
</form>

</body>
</html>
    