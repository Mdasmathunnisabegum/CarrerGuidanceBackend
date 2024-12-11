package com.klef.jfsd.apms.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ClientController 
{
	
	@GetMapping("/")
	public String main()
	{
		
		return "home";
	
	}
	
	@GetMapping("login")
	public String login()
	{
		
		return "login";
		
	}

	@GetMapping("contact")
	public String contact()
	{
		
		return "contact";
		
	}
	
	@GetMapping("about")
	public String about()
	{
		
		return "about";
		
	}
	
	@GetMapping("developers")
	public String developers()
	{
		
		return "developers";
		
	}
	
	
}
