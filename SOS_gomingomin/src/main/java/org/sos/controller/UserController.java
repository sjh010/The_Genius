package org.sos.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller("UserController")
public class UserController {
	
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	
	
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String getLoginPage(){
		
		return "user/login"; 
	}
	

}
