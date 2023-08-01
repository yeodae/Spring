package com.example.test1.controller;

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

import com.example.test1.dao.BoardService;
import com.example.test1.model.Board;
import com.google.gson.Gson;

@Controller
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@Autowired
	HttpSession session; //세션 객체 생성
	
	@RequestMapping("/board/add.do") 
    public String join(Model model) throws Exception{

        return "/board-add";
    }
	
	@RequestMapping("/board/list.do") 
    public String boardList(HttpServletRequest request,Model model) throws Exception{
		
		//request.setAttribute("status", session.getAttribute("sessionStatus"));
		//request 로 값을 불러와 board-list에 값을 보내준다.
		
        return "/board-list";
    }
	
	@RequestMapping("/board/view.do") 
    public String view(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-view";
    }
	
	@RequestMapping("/board/edit.do") 
    public String edit(HttpServletRequest request, Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-edit";
    }
	
	@RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String userAdd(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.addBoard(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String list(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Board> list = boardService.searchBoardList(map);
		resultMap.put("boardList", list);
		return new Gson().toJson(resultMap);
	}
	
	@RequestMapping(value = "/board/remove.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String remove(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.removeBoard(map);
		return new Gson().toJson(resultMap);
	}
	
	
	@RequestMapping(value = "/board/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String view(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board board = boardService.searchBoardInfo2(map);
		resultMap.put("info", board);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/board/update.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardUp(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.updateBoard(map);
		resultMap.put("message", "success");
		return new Gson().toJson(resultMap);
	}
}
