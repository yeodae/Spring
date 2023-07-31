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
	public int addBoard(HashMap<String, Object> map) {
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

	@Override
	public Board searchBoardInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		boardMapper.updateBoardCnt(map);
		return boardMapper.selectBoardInfo(map);
	}

	@Override
	public int editBoard(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return boardMapper.updateBoard(map);
	}
}
