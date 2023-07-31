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
		if(cnt > 0) { // 둘다 있는경우
			resultMap.put("success", true);
			resultMap.put("message","환영합니다.");
		}else {
			resultMap.put("success", false);
			if(userMapper.userCnt(map) > 0) { // 아이디만 있는경우
				resultMap.put("message","패스워드를 확인하세요.");
			}else { // 아이디도 없는 경우
				resultMap.put("message","존재하지 않는 아이디입니다.");
			}
		}
		return resultMap;
	}
}
