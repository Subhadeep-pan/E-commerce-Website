<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <% String transactionId=request.getParameter("payment_id");%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Place Your Order</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Roboto', sans-serif;
      background: linear-gradient(to right, #f7f8fc, #dbeafe);
      margin: 0;
      padding: 0;
      display: flex;
      align-items: center;
      justify-content: center;
      height: 100vh;
    }

    form {
      background-color: #ffffff;
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
      width: 100%;
      max-width: 400px;
    }

    h2 {
      margin-bottom: 20px;
      color: #1f2937;
    }

    label {
      display: block;
      margin-bottom: 8px;
      color: #374151;
      font-weight: 500;
    }

    input[type="text"] {
      width: 100%;
      padding: 10px 12px;
      margin-bottom: 20px;
      border: 1px solid #cbd5e1;
      border-radius: 8px;
      transition: border-color 0.3s ease;
      font-size: 16px;
    }

    input[type="text"]:focus {
      border-color: #3b82f6;
      outline: none;
    }

    input[type="submit"] {
      width: 100%;
      padding: 12px;
      background-color: #3b82f6;
      color: white;
      border: none;
      border-radius: 8px;
      font-size: 16px;
      font-weight: bold;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #2563eb;
    }
  </style>
</head>
<body>
  <form action="/order" method="post">
    <h2>Order Details</h2>
    
    <label for="address">Enter Your Address to Deliver:</label>
    <input type="text" id="address" name="address" placeholder="e.g. 123 Street, City, ZIP">

    <input type="hidden" name="tdetails" value="<%= transactionId %>">

    <input type="submit" value="Place Order">
  </form>
</body>
</html>
    