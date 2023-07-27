package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.BoardMapper;
import com.example.test1.model.Board;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardMapper boardMapper;

	@Override
	public int boardAdd(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.insertBoard(map);
	}

	@Override
	public List<Board> searchBoardList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.selectBoardList(map);
	}

	@Override
	public int removeBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.deleteBoard(map);
	}

//	@Override 
//	public int updateBoard(HashMap<String, Object> map) {
//		// TODO Auto-generated method stub
//		return boardMapper.cntBoard(map);
//	} 글을 클릭시 조회수만 증가하면 되므로 이후 과정은 생략이 가능하다.

	@Override
	public Board searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.cntBoard(map); // 게시물상세전에>> 조회수증가 쿼리 추가
		return boardMapper.selectBoardInfo(map);
	}

	@Override
	public int editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.updateBoard(map);
	}
	
}
