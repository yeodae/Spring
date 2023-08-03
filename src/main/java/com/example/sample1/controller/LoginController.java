package com.example.sample1.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.sample1.model.User;
import com.example.sample1.service.UserService;
import com.google.gson.Gson;


@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	HttpSession session; //세션 객체 생성
	 
	@RequestMapping("/login.do") 
    public String login(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		//session.removeAttribute("sessionName");
		//session.removeAttribute("sessionId");
		//세션 하나씩 삭제
		session.invalidate();
		//세션 전체삭제
        return "/login";
    }
	@RequestMapping("main.do") 
    public String main(Model model) throws Exception{
		String status = (String) session.getAttribute("sessionStatus");
		if(status.equals("A")) {
			return "main";
		}else {
			return "redirect:board/list.do";
		}
		//System.out.println(session.getAttribute("sessionId"));
		//로그인시 세션값 넘어가는지 확인
    }
	@RequestMapping("/join.do") 
    public String join(Model model) throws Exception{

        return "/join";
    }
	
	@RequestMapping("/minigame.do") 
    public String minigame(Model model) throws Exception{

        return "/minigame";
    }
	
	@RequestMapping(value = "/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String empList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<User> list = userService.searchUserList(map);
		resultMap.put("list", list);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping("/user/list.do") 
    public String list(Model model,HttpServletRequest request) throws Exception{
		//관리자외 접근금지 설정하기
		HttpSession session = request.getSession();
		String status = (String) session.getAttribute("sessionStatus");
		if(!status.equals("A")) {
			return "redirect:../main.do";
		}
        return "/userList";
    }
	@RequestMapping(value = "/login.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String login(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		resultMap = userService.searchUser(map);
		
		if(resultMap.containsKey("user")){
			// containKey ~ 키값이 있을경우 true 없을경우 false
			User user = (User) resultMap.get("user"); 
			//(다운캐스팅) 키값 있는걸 확인후(오류방지) 꺼내기
			session.setAttribute("sessionId", user.getuId());
			session.setAttribute("sessionName", user.getuName());
			session.setAttribute("sessionStatus", user.getStatus());
			//호출된 User값을 세션에 값주기
		}
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		userService.addUser(map);
		resultMap.put("success", "가입완료");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/check.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String check(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userService.searchUserCnt(map);
		resultMap.put("cnt", cnt);
		return new Gson().toJson(resultMap);
	}
	//주소 API 검색
	@RequestMapping("/addr.do") 
    public String addr(Model model, @RequestParam HashMap<String, Object> map, HttpServletRequest request) throws Exception{
		
		return "/jusoPopup";
    }

}
