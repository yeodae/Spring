package com.example.test1.dao;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;

	@Override
	public int addUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.insertUser(map);
	}

	@Override
	public int searchUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.userCnt(map);
	}

	@Override
	public HashMap<String, Object> searchUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		int cnt = userMapper.selectUser(map);
		if(cnt > 0) {
			resultMap.put("success", true);
			resultMap.put("message", "환영합니다.");
		} else {
			resultMap.put("success", false);
			if(userMapper.userCnt(map) > 0) {
				resultMap.put("message", "패스워드 확인해라.");
			} else {
				resultMap.put("message", "없는 아이디");
			}
		}
		return resultMap;
	}
}
