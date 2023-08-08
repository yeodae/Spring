package com.example.sample1.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MainController {
	@RequestMapping("/main.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/main";
    }
	
	@RequestMapping("/minigame.do") 
    public String game(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/minigame";
    }
}
