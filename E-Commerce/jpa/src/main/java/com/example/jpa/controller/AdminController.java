package com.example.jpa.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.jpa.dao.OrderDao;
import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.model.Order;
import com.example.jpa.model.User;


@Controller
public class AdminController {
	
	@Autowired 
	 ProductDao pd; 
	  
	 @Autowired 
	 UserDao ud; 
	  
	 @Autowired 
	 OrderDao od; 
	
	@RequestMapping("/dash")
	public String dashboard()
	{
		return "dashboard";
	}

	@RequestMapping("/addform")
	public String addForm()
	{
		return "addForm";
	}
	@RequestMapping("/viewUser")
	public String viewUser(Model model) {
		List<User> user = ud.findAll();
		model.addAttribute("userDetails", user);
		return "user";
	}
		
	@RequestMapping("/viewOrder")
	public String viewOrder(Model model) {
		List<Order> order = od.findAll();
		model.addAttribute("order", order);
		return "order";
	}
	
	}


