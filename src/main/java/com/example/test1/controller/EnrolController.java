package com.example.test1.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.test1.dao.EnrolService;
import com.example.test1.model.Enrol;
import com.google.gson.Gson;

@Controller
public class EnrolController {
	
	@Autowired
	EnrolService enrolService;
	
	@RequestMapping("/enrol.do") //만든 주소명
    public String main(Model model, @RequestParam HashMap<String, Object> map) throws Exception{

        return "/enrol-list";//파일명
    }
	
	//테이블조회
	@RequestMapping(value = "/enrolList.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Enrol> list = enrolService.searchEnrolList(map);
		resultMap.put("enrolList", list);
		return new Gson().toJson(resultMap);
	}
	//성적삭제
	@RequestMapping(value = "/enrol/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		enrolService.removeEnrol(map);
		resultMap.put("success", "삭제완료");
		return new Gson().toJson(resultMap);
	}
	//상세보기
	@RequestMapping(value = "/enrol/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = enrolService.enrolInfo(map);
		return new Gson().toJson(resultMap);
	}
	//이름 수정
	@RequestMapping(value = "/enrol/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String enrolUpdate(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		enrolService.enrolUpdate(map);
		resultMap.put("success", "수정완료");
		return new Gson().toJson(resultMap);
	}
	
}
