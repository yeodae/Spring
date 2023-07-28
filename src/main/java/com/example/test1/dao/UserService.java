package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	//회원가입 insert
	int addUser(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	//User 테이블 검색
	int searchUserCnt(HashMap<String, Object> map);
}
