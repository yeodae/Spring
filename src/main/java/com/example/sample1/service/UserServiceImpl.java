package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sample1.mapper.UserMapper;
import com.example.sample1.model.User;

@Service
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> searchUserList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.selectUserList(map);
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
				resultMap.put("message",user.getuName()+"님 환영합니다.");
				resultMap.put("user",user);
			}
		}else {
			resultMap.put("success", false);
			User tempUser = userMapper.userCheckId(map);
			if(tempUser != null) { // 아이디만 있는경우
				userMapper.updateUserCnt(map);
				//로그인 실패시 Cnt 증가
				int cnt = tempUser.getCnt() + 1;
				//아이디는 있고 패스워드 틀릴시 cnt + 1
				String message = cnt + "번 틀렸습니다. \n비밀번호를 확인하세요.";
				if(cnt >= 5) {
					message = "5회 이상 실패! \n관리자에게 문의해주세요.";
				}
				resultMap.put("message",message);
			}else { // 아이디도 없는 경우
				resultMap.put("message","존재하지 않는 아이디입니다.");
			}
		}
		return resultMap;
	}

	@Override
	public int resetUserCnt(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.resetUserCnt(map);
	}

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
}
