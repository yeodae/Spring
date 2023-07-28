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
import com.example.test1.model.Student2;
import com.example.test1.model.Subject;
import com.google.gson.Gson;

@Controller
public class StudentController {
	//주소를만들고 데이터를 호출하는 영역
	@Autowired
	StudentService studentService;
	
	@RequestMapping("/student.do") //만든 주소명
    public String main(Model model) throws Exception{

        return "/student-list";
    }
	@RequestMapping("/student2.do") //만든 주소명
    public String main2(Model model) throws Exception{

        return "/student-list2";
    }
	@RequestMapping("/student3.do") //만든 주소명
    public String main3(Model model) throws Exception{

        return "/student-list3";
    }
	@RequestMapping("/test.do") //만든 주소명
    public String test(Model model) throws Exception{

        return "/first";
    }
	@RequestMapping("/stu.do") //만든 주소명
    public String day2(Model model) throws Exception{

        return "/s-list";
    }
	@RequestMapping("/sample.do") //만든 주소명
    public String day2_2(Model model) throws Exception{

        return "/sample";
    }
	@RequestMapping("/sample2.do") //만든 주소명
    public String day3_1(Model model) throws Exception{

        return "/sample2";
    }
	@RequestMapping("/emp.do") //만든 주소명
    public String day3_2(Model model) throws Exception{

        return "/emp"; // 파일명
    }
	@RequestMapping("/subject.do") //만든 주소명
    public String day3_3(Model model) throws Exception{

        return "/subject"; // 파일명
    }
	
	//student2테이블
	@RequestMapping("/lastStu.do") //만든 주소명
    public String last(Model model) throws Exception{

        return "/lastStudent";
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
		resultMap.put("subjectList", list);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/stu/info.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String stuInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = studentService.searchStudentInfo(map);
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
	public String removeEmp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.removeEmp(map);
		resultMap.put("success", "삭제완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/emp/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateEmp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.updateEmp(map);
		resultMap.put("success", "수정완료");
		return new Gson().toJson(resultMap);
	}
	
	
	
	@RequestMapping(value = "/lastStudent/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String lastStuList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Student2> list = studentService.searchlastStudentList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/lastStudent/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String removeStu(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		studentService.removelastStudent(map);
		resultMap.put("success", "삭제완료"); //리턴값이 없어 생략 가능
		return new Gson().toJson(resultMap);
	}
}


