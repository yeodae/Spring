package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
	//게시글등록
	int boardAdd(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	//게시글 조회
	List<Board> searchBoardList(HashMap<String, Object> map);
	//게시글 삭제
	int removeBoard(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	
//	int updateBoard(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	//게시글 상세
	Board searchBoardInfo(HashMap<String, Object> map);
	//게시글 수정
	int editBoard(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	
}
