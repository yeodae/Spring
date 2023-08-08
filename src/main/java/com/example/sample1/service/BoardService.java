package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import com.example.sample1.model.Board;

public interface BoardService {
	// 게시글 목록
	List<Board> searchBoardList(HashMap<String, Object> map);
	// 게시글 상세보기 + 댓글
	HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map);
	// 댓글 등록
	int addBoardComment(HashMap<String, Object> map);
	// 댓글 삭제
	int removeComment(HashMap<String, Object> map);
	// 게시글 등록
	int addBoard(HashMap<String, Object> map);
	// 게시글 수정
	int editBoard(HashMap<String, Object> map);
	// 게시글 삭제
	int removeBoard(HashMap<String, Object> map);
	// 댓글 삭제(관리자)
	int removeCommentAdmin(HashMap<String, Object> map);
}
