package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.EnrolService;
import com.example.test1.model.Enrol;
import com.example.test1.model.Student;
import com.google.gson.Gson;

@Controller
public class EnrolController {
	
	@Autowired
	EnrolService enrolService;
	
	@RequestMapping("/enrol.do") 
    public String join(Model model) throws Exception{

        return "/enrol-list";
    }
	
	@RequestMapping("/userInfo.do") 
    public String userInfo(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/userInfo";
    }
	
	@RequestMapping(value = "/enrolList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrol(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Enrol> list = enrolService.selectEnrolList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/enrolRemove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolRemove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		enrolService.removeEnrol(map);
		
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/enrolInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student s = enrolService.searchEnrolInfo(map);
		resultMap.put("info", s);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/enrolEdit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		enrolService.editEnrol(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/userInfo.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student s = enrolService.searchUserInfo(map);
		resultMap.put("info", s);
		return new Gson().toJson(resultMap);
	}
}
