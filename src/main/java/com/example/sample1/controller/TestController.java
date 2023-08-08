package com.example.sample1.controller;

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

import com.example.sample1.model.Chart;
import com.example.sample1.service.ChartService;
import com.google.gson.Gson;

@Controller
public class TestController {
	
	@Autowired
	ChartService chartService;
	
	@RequestMapping("/test.do") 
    public String test(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/test";
    }
	
	@RequestMapping("/pay.do") 
    public String pay(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/pay-test";
    }
	
	@RequestMapping("/chart.do") 
    public String chart(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/chart";
    }
	
	@RequestMapping("/chart2.do") 
    public String chart2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/chart2";
    }
	
	@RequestMapping("/chart3.do") 
    public String chart3(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/chart3";
    }
	@RequestMapping("/chart4.do") 
    public String chart4(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/chart4";
    }
	@RequestMapping("/chart4-2.do") 
    public String chart4_2(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
        return "/chart4-2";
    }
	@RequestMapping(value = "/coin.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String coin(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Chart> list = chartService.searchCoinList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/domain.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String domain(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Chart> list = chartService.searchDomainList();
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/language.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String language(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartService.searchLanList();
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/gazua.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String gazua(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = chartService.searchGazua();
		//한줄로도 처리 가능
		//HashMap<String, Object> resultMap = chartService.searchGazua();
		return new Gson().toJson(resultMap);
	}
}
