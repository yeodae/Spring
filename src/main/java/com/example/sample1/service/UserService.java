package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import com.example.sample1.model.User;

public interface UserService {
	//유저 리스트 출력
	List<User> searchUserList(HashMap<String, Object> map);
	//중복체크
	int searchUserCnt(HashMap<String, Object> map);
	//유저 아이디 패스워드 검사
	HashMap<String, Object> searchUser(HashMap<String, Object> map);
	//로그인 횟수 리셋
	int resetUserCnt(HashMap<String, Object> map);
	//회원가입
	int addUser(HashMap<String, Object> map);
}
