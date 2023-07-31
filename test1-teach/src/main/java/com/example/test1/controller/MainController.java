package com.example.test1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	
	@RequestMapping("/login.do") 
    public String view(Model model) throws Exception{

		return "/login";
    }
	
	@RequestMapping("/main.do") 
    public String main(Model model) throws Exception{

		return "/main";
    }
}
