package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.UserMapper;
import com.example.test1.model.User;

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
		User user = userMapper.selectUser(map);
		//user 값 전체 호출
		if(user != null) { // 둘다 있는경우
			if(user.getCnt() >= 5) {
				resultMap.put("success", false);
				resultMap.put("message","5회 이상 실패, 관리자에게 문의하세요.");
			}else {
				userMapper.resetUserCnt(map);
				//로그인 성공시 Cnt 초기화
				resultMap.put("success", true);
				resultMap.put("message","환영합니다.");
				resultMap.put("user",user);
			}
		}else {
			resultMap.put("success", false);
			if(userMapper.userCnt(map) > 0) { // 아이디만 있는경우
				userMapper.updateUserCnt(map);
				//로그인 실패시 Cnt 증가
				resultMap.put("message","패스워드를 확인하세요.");
			}else { // 아이디도 없는 경우
				resultMap.put("message","존재하지 않는 아이디입니다.");
			}
		}
		return resultMap;
	}

	@Override
	public List<User> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserList(map);
	}

	@Override
	public int resetUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.resetUserCnt(map);
	}

	@Override
	public int banUser(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.updateUserBan(map);
	}
}
