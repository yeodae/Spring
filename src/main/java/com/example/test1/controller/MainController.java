package com.example.test1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	
	
	 //@Autowired 
	 //MainService mainService;
	 
	
	@RequestMapping("/login.do") 
    public String login(Model model) throws Exception{

        return "/login";
    }
	@RequestMapping("/main.do") 
    public String main(Model model) throws Exception{

        return "/main";
    }
	
	
}
