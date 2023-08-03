package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import com.example.sample1.model.Board;

public interface BoardService {
	//게시판 리스트 호출
	List<Board> searchBoardList(HashMap<String, Object> map);
	//단일 게시물 상세보기 ~ 단일 Board 객체에서 여러개의 값을 가져오기위해 HashMap으로 변경
	HashMap<String, Object> serachBoardInfo(HashMap<String, Object> map);
	//댓글등록
	int addBoardComment(HashMap<String, Object> map);
	//댓글숨김 
	int removeComment(HashMap<String, Object> map);
	//게시글 등록
	int addBoard(HashMap<String, Object> map);
	//게시물 삭제
	int removeBoard(HashMap<String, Object> map);
	//게시물 수정
	int updateBoardInfo(HashMap<String, Object> map);
	
}
