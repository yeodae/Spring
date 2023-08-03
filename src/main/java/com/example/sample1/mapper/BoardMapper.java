package com.example.sample1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sample1.model.Board;

@Mapper
public interface BoardMapper {
	//테이블 리스트 전체출력
	List<Board> selectBoardList(HashMap<String, Object> map);
	//단일 게시물 상세보기
	Board selectBoardInfo(HashMap<String, Object> map);
	//댓글 등록
	int insertComment(HashMap<String, Object> map);
	//댓글목록리스트 호출
	List<Board> selectBoardComment(HashMap<String, Object> map);
	//댓글숨김
	int deleteComment(HashMap<String, Object> map);
	//게시글 등록
	int insertBoard(HashMap<String, Object> map);
	//조회수 증가
	int updateBoardCnt(HashMap<String, Object> map);
	//게시물 삭제
	int deleteBoard(HashMap<String, Object> map);
	//게시물 수정
	int updateBoardEdit(HashMap<String, Object> map);
}
