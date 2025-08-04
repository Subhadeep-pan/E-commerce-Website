<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Order Success</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <!-- Font & Styles -->
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@500;700&display=swap" rel="stylesheet">
  <style>
    body {
      font-family: 'Inter', sans-serif;
      background: linear-gradient(135deg, #e0f7e9, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      margin: 0;
    }

    .container {
      text-align: center;
      background: #ffffff;
      padding: 40px 30px;
      border-radius: 16px;
      box-shadow: 0 10px 25px rgba(0, 0, 0, 0.08);
      max-width: 400px;
      width: 90%;
    }

    h2 {
      color: #2e7d32;
      margin-bottom: 20px;
    }

    p {
      color: #37474f;
      font-size: 16px;
      margin-bottom: 15px;
    }

    .success-icon {
      font-size: 48px;
      color: #4caf50;
      margin-bottom: 10px;
    }

    .btn {
      display: inline-block;
      padding: 12px 24px;
      background-color: #2e7d32;
      color: white;
      text-decoration: none;
      border-radius: 8px;
      font-weight: bold;
      transition: background-color 0.3s ease;
      margin-top: 15px;
    }

    .btn:hover {
      background-color: #1b5e20;
    }
  </style>
</head>
<body>

<div class="container">
  <div class="success-icon">✅</div>
  <h2>Payment Successful</h2>
  <p>Your payment was successful!</p>
  <p><strong>Payment ID: response.razorpay_payment_id</strong> ${paymentId}</p>
  <a href="/" class="btn">Go Back to Home</a>
</div>

</body>
</html>

