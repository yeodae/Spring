package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sample1.mapper.BoardMapper;
import com.example.sample1.model.Board;

@Service
public class BoardServiceImpl implements BoardService{

	@Autowired
	BoardMapper boardMapper;
	
	@Override
	public List<Board> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList(map);
	}

	@Override
	public HashMap<String, Object> searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		// 조회수 증가
		if(!map.containsKey("kind")) {
			boardMapper.boardCnt(map);
		}
		// 게시글 상세보기
		resultMap.put("info", boardMapper.selectBoardInfo(map));
		// 댓글 목록
		resultMap.put("commentList", boardMapper.selectBoardComment(map));
		return resultMap;
	}

	@Override
	public int addBoardComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.insertComment(map);
	}

	@Override
	public int removeComment(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteComment(map);
	}

	@Override
	public int addBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.insertBoard(map);
	}

	@Override
	public int editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.updateBoard(map);
	}

	@Override
	public int removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoard(map);
	}

	@Override
	public int removeCommentAdmin(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteCommentAdmin(map);
	}
}
