<%@page import="com.example.jpa.model.Order"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.example.jpa.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Hexashop</title>
	<link rel="icon" type="image/x-icon" href="${pageContext.request.contextPath}/images/favicon.ico">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/admindashboard.css">
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>

	<!-- Dashboard section starts here -->
	<div class="container">
		<div class="navigation">
			<ul>
				<li><a href="dash"> <span class="icon" style="padding-top: 1.15px;"><i class="fa-solid fa-circle-user" style="font-size: 1.5rem;"></i></span> <span
						class="title"><h2>Dashboard</h2></span>
				</a></li>
				<li><a href="dash" class="dashboard_options"> <span class="icon"><i
							class="fa fa-home" aria-hidden="true"></i></span> <span class="title">Home</span>
				</a></li>

				<li><a href="addForm" class="dashboard_options"> <span class="icon"><i class="fa-solid fa-hamburger"></i><i class="fa-solid fa-plus" style="font-size: 8px;"></i></span> <span class="title">Add
							Products</span>
				</a></li>
				<li><a href="viewUser" class="dashboard_options"> <span class="icon"><i
							class="fa fa-user" aria-hidden="true"></i></span> <span class="title">View
							User</span>
				</a></li>
				<li><a href="viewOrder" class="dashboard_options"> <span class="icon"><i class="fa-solid fa-bag-shopping"></i></span> <span class="title">View
							Order</span>
				</a></li>
				<li><a href="viewFeedback" class="dashboard_options"> <span class="icon"><i class="fa-solid fa-comments"></i></span> <span class="title">View
							Feedback</span>
				</a></li>

				<li><a href="admin/logout" class="dashboard_options"> 
				<span class="icon"><i class="fa fa-sign-out" aria-hidden="true"></i></span> 
				<span class="title">Log out</span>
				</a></li>
			</ul>
		</div>
		<!-- Dashboard section ends here -->

		<div class="main">
			<div class="topbar">
				<div class="toggle"></div>
				<div class="search">
					<label for="html"> <input type="text"
						placeholder="Search Here"> <i class="fa fa-search"
						aria-hidden="true"></i>
					</label>
				</div>
				<div class="user">
					<a href="dash">
						<img src="${pageContext.request.contextPath}/images/Logolight.png" style="height: 40px; padding-right: 1rem; padding-top: 0.2rem;">
					</a>
				</div>
			</div>


			<div class="cardbox">
				<div class="card" style="box-shadow: 0.05px 0px 1.1px black;">
					<div>
						<div class="numbers">${activeUsers}</div>
						<div class="cardname">Active Users</div>
						<div class="numbers"></div>
					</div>
					<div class="iconbox">
						<i class="fa fa-users" aria-hidden="true" style="color: #7884FF;"></i>
					</div>
				</div>
				<div class="card" style="box-shadow: 0.05px 0px 1.1px black;">
					<div>
						<div class="numbers">${foodItems}</div>
						<div class="cardname">Products</div>
						<div class="numbers"></div>
					</div>
					<div class="iconbox">
						<i class="fa-solid fa-burger" aria-hidden="true" style="color: #7884ff;"></i>
					</div>
				</div>
				<div class="card" style="box-shadow: 0.05px 0px 1.1px black;">
					<div>
						<div class="numbers">${sales}</div>
						<div class="cardname">Sales</div>
						<div class="numbers"></div>
					</div>
					<div class="iconbox">
						<i class="fa-solid fa-cart-plus" aria-hidden="true" style="color: #7884FF;"></i>
					</div>
				</div>


			</div>


			<div class="details">
				<div class="recentorders" style="width: 1000px;">
					<div class="cardheader">
						<div>
							<i class="fa-solid fa-cart-shopping" style="font-size: 21.5px;"></i>&nbsp;
							<h2 style="display: inline-block;">Order Details</h2>
						</div>
						<a href="#" class="btn">View All</a>
					</div>
					<table>
						<thead>
							<tr>
								<th>Order Id</th>
								<th>Email</th>
								<th>User Name</th>
								<th>Phone No.</th>
								<th>Address</th>
								<th>Item Name</th>
								<th>Price</th>
								<th>Payment Id</th>
							</tr>
						</thead>
						<tbody>
							<tr>
							<% 
								List<Order> order = (List<Order>)request.getAttribute("order");
								if(order != null && !order.isEmpty()){
									for(Order o: order){
							%>
							<td style="text-align: center;"><%= o.getOrderId() %></td>
							<td style="text-align: center;"><%= o.getCustId() %></td>
							<td style="text-align: center;"><%= o.getName() %></td>
							<td style="text-align: center;"><%= o.getPhno() %></td>
							<td style="text-align: center;"><%= o.getAddress() %></td>
							<td style="text-align: center;"><%= o.getProdName() %></td>
							<td style="text-align: center;"><%= o.getPrice() %></td>
							<td style="text-align: center;"><%= o.getTransDetails() %></td>
							</tr>
							<% 
								}
							}else{
							%>
							<td colspan="9" style="text-align:center;"><h4 style="color: black; padding: 0.5rem 0rem; color: red;">No Order to display!</h4></td>
							<% } %>
						</tbody>
					</table>
				</div>
				
			</div>
			
		</div>
		
	</div>
	
	<%
	    String login = request.getParameter("login");
	    if ("success".equals(login)) {
	%>
	    <script>
	        Swal.fire({
	            icon: 'success',
	            title: 'Log in successful!',
	            text: 'You have been logged in successfully.',
	            timer: 2500
	        });
	
	        // Remove 'logout=success' from URL without reloading the page
	        if (window.history.replaceState) {
	            const url = new URL(window.location);
	            url.searchParams.delete('login');
	            window.history.replaceState(null, '', url);
	        }
	    </script>
	<%
	    }
	%>
</body>
</html>