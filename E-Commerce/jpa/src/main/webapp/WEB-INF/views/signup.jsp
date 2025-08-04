<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sign Up</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        background: linear-gradient(rgba(0,0,0,0.6), rgba(0,0,0,0.6)),
                    url('images/signup-background.jpg') no-repeat center center/cover;
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    }

    .signup-container {
        height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .card {
        padding: 30px;
        border-radius: 20px;
        box-shadow: 0px 8px 30px rgba(0,0,0,0.4);
        background-color: rgba(255, 255, 255, 0.95);
        animation: fadeIn 1s ease-in-out;
    }

    h3 {
        font-weight: bold;
        color: #333;
    }

    .form-control {
        border-radius: 10px;
        transition: 0.3s all;
    }

    .form-control:focus {
        border-color: #007bff;
        box-shadow: 0 0 8px rgba(0,123,255,0.3);
    }

    .btn-primary {
        border-radius: 25px;
        transition: 0.3s background-color;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .text-center a {
        color: #007bff;
        text-decoration: none;
    }

    .text-center a:hover {
        text-decoration: underline;
    }

    @keyframes fadeIn {
        from { opacity: 0; transform: translateY(-20px); }
        to { opacity: 1; transform: translateY(0); }
    }
</style>
</head>
<body>
<br><br><br>
<div class="signup-container">
    <div class="card col-md-5">
        <h3 class="text-center mb-4">Create Your Account</h3>
        <h4 class="text-center text-danger">${msg}</h4>
        <form action="regproc" method="post">
            <div class="form-group">
                <label for="name">Full Name</label>
                <input type="text" name="name" class="form-control" id="name" placeholder="Enter your full name" required>
            </div>
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone Number</label>
                <input type="text" name="phone" class="form-control" id="phone" placeholder="Enter your phone number" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Create a password" required>
            </div>
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
            </div>
            <div class="text-center">
                <small>Already have an account? <a href="log">Login here</a></small>
            </div>
        </form>
    </div>
</div>
</body>
</html>
