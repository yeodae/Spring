package com.example.test1.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.UserService;
import com.google.gson.Gson;

@Controller
public class UserController {
	
	@Autowired
	UserService userService;
	
	@RequestMapping("/user/join.do") 
    public String join(Model model) throws Exception{

        return "/user_join";
    }
	
	@RequestMapping(value = "/user/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		resultMap.put("success", "가입완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/user/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUser(map);
		return new Gson().toJson(resultMap);
	}
}
