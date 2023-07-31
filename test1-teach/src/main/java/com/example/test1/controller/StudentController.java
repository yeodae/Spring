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

import com.example.test1.dao.StudentService;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;
import com.google.gson.Gson;

@Controller
public class StudentController {
	
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/student.do") 
    public String main(Model model) throws Exception{

        return "/student-list";
    }
	
	@RequestMapping("/student2.do") 
    public String main2(Model model) throws Exception{

        return "/student-list2";
    }
	
	@RequestMapping("/student3.do") 
    public String main3(Model model) throws Exception{

        return "/student-list3";
    }
	
	@RequestMapping("/stu.do") 
    public String test(Model model) throws Exception{

        return "/s-list";
    }
	
	@RequestMapping("/sample.do") 
    public String sample(Model model) throws Exception{

        return "/sample";
    }
	
	@RequestMapping("/sample2.do") 
    public String sample2(Model model) throws Exception{

        return "/sample2";
    }
	
	@RequestMapping("/emp.do") 
    public String emp(Model model) throws Exception{

        return "/emp";
    }
	
	@RequestMapping("/subject.do") 
    public String subject(Model model) throws Exception{

        return "/subject";
    }
	
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String searchBbsList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student> list = studentService.searchStudentList(map);
		resultMap.put("list", list);
		resultMap.put("result", "success");
		resultMap.put("name", "홍길동");
		resultMap.put("vue", "쉽다!!!!!!!!!!!");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/emp/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String empList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Emp> list = studentService.searchEmpList(map);
		resultMap.put("empList", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/subject/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String subjectList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Subject> list = studentService.searchSubjectList(map);
		resultMap.put("subList", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = studentService.searchStudentInfo(map);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/stu/info2.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuInfo2(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student info = studentService.searchStudentInfo2(map);
		resultMap.put("info", info);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/stu/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.removeStudent(map);
		resultMap.put("success", "삭제완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/emp/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String emp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.removeEmp(map);
		resultMap.put("success", "삭제완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/emp/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String empEdit(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.editEmp(map);
		resultMap.put("success", "수정완료");
		return new Gson().toJson(resultMap);
	}
}


