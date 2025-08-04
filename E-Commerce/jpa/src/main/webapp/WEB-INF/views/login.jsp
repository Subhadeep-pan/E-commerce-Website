<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
    body {
        margin: 0;
        padding: 0;
        height: 100vh;
        background: linear-gradient(120deg, rgba(0, 0, 0, 0.7), rgba(34, 34, 34, 0.7)),
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
        box-shadow: 0 4px 25px rgba(0,0,0,0.4);
        background: rgba(255, 255, 255, 0.97);
        animation: fadeIn 1s ease-in-out;
    }

    .card h3 {
        color: #333;
        font-weight: 600;
    }
    .form-control {
        border-radius: 10px;
        transition: all 0.3s ease-in-out;
    }
    .form-control:focus {
        box-shadow: 0 0 5px rgba(0,123,255,0.6);
        border-color: #007bff;
    }

    .btn-primary {
        border-radius: 25px;
        transition: background-color 0.3s ease;
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
        <h3 class="text-center mb-4">Login Here..!</h3>
        <h4 class="text-center text-danger">${msg}</h4>
        <form action="logproc" method="post">
            
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" name="email" class="form-control" id="email" placeholder="Enter your email" required>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" class="form-control" id="password" placeholder="Enter your password" required>
            </div>
            
            <div class="form-group text-center">
                <button type="submit" class="btn btn-primary btn-block">Login</button>
            </div>
            
            <div class="text-center">
                <small>New User? <a href="reg">Sign Up here</a></small>
            </div>
        </form>
    </div>
</div>
</body>
</html>
