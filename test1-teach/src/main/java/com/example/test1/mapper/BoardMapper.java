package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	int insertBoard(HashMap<String, Object> map);
	
	List<Board> selectBoardList(HashMap<String, Object> map);
	
	int deleteBoard(HashMap<String, Object> map);
	
	Board selectBoardInfo(HashMap<String, Object> map);
	
	int updateBoardCnt(HashMap<String, Object> map);
	
	int updateBoard(HashMap<String, Object> map);
	
	
}
