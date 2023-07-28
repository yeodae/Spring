package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Board;

@Mapper
public interface BoardMapper {
	// 게시글 등록
	int insertBoard(HashMap<String, Object> map);
	// 보드 테이블 조회
	List<Board> selectBoardList(HashMap<String, Object> map);
	// 게시글 삭제
	int deleteBoard(HashMap<String, Object> map);
	// 조회수
	int cntBoard(HashMap<String, Object> map);
	// 게시글 상세
	Board selectBoardInfo(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
	
}
