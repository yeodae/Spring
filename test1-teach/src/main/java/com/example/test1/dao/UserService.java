package com.example.test1.dao;

import java.util.HashMap;

public interface UserService {
	int addUser(HashMap<String, Object> map);
	// 중복체크
	int searchUserCnt(HashMap<String, Object> map);
	
	HashMap<String, Object> searchUser(HashMap<String, Object> map);
}
