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

import com.example.test1.dao.BoardService;
import com.example.test1.model.Board;
import com.google.gson.Gson;

@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/list.do") //만든 주소명
    public String day4_4(Model model) throws Exception{

        return "/board-list"; // 파일명
    }
	@RequestMapping("/board/add.do") //만든 주소명
    public String day4_1(Model model) throws Exception{

        return "/board-add"; // 파일명
    }
	//상세보기 페이지전환
	@RequestMapping("/board/view.do") //만든 주소명
    public String view(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-view"; // 파일명
    }
	//게시글 수정
	@RequestMapping("/board/edit.do") //만든 주소명
    public String edit(HttpServletRequest request,Model model, @RequestParam HashMap<String, Object> map) throws Exception{
		request.setAttribute("map", map);
        return "/board-edit"; // 파일명
    }
	
	@RequestMapping(value = "/board/add.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String add(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.boardAdd(map);
		resultMap.put("success", "등록완료");
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/board/list.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardList(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
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
		resultMap.put("success", "삭제완료"); //리턴값이 없어 생략 가능
		return new Gson().toJson(resultMap);
//	}
//	@RequestMapping(value = "/board/cnt.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
//	@ResponseBody
//	public String cnt(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
//		HashMap<String, Object> resultMap = new HashMap<String, Object>();
//		boardService.updateBoard(map);
//		resultMap.put("success", "조회수증가");
//		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/board/view.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String boardInfo(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Board board = boardService.searchBoardInfo(map);
		resultMap.put("info", board);
		return new Gson().toJson(resultMap);
	}
	@RequestMapping(value = "/board/edit.dox", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String updateBoard(Model model, @RequestParam HashMap<String, Object> map) throws Exception {
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		boardService.editBoard(map);
		resultMap.put("success", "수정완료");
		return new Gson().toJson(resultMap);
	}
	
}
