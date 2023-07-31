package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Board;

public interface BoardService {
	int addBoard(HashMap<String, Object> map);
	
	List<Board> searchBoardList(HashMap<String, Object> map);
	
	int removeBoard(HashMap<String, Object> map);
	
	Board searchBoardInfo(HashMap<String, Object> map);
	
	int editBoard(HashMap<String, Object> map);
	
}
