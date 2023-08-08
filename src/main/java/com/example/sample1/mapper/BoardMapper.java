package com.example.sample1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sample1.model.Board;

@Mapper
public interface BoardMapper {
	// 게시판 목록
	List<Board> selectBoardList(HashMap<String, Object> map);
	// 게시글 상세보기
	Board selectBoardInfo(HashMap<String, Object> map);
	// 댓글 등록
	int insertComment(HashMap<String, Object> map);
	// 댓글 목록
	List<Board> selectBoardComment(HashMap<String, Object> map);
	// 댓글 삭제
	int deleteComment(HashMap<String, Object> map);
	// 조회수 증가
	int boardCnt(HashMap<String, Object> map);
	// 게시글 등록
	int insertBoard(HashMap<String, Object> map);
	// 게시글 수정
	int updateBoard(HashMap<String, Object> map);
	// 게시글 삭제
	int deleteBoard(HashMap<String, Object> map);
	// 댓글 삭제(관리자)
	int deleteCommentAdmin(HashMap<String, Object> map);
}
