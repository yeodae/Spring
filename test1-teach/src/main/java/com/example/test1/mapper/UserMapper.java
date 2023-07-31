package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	int insertUser(HashMap<String, Object> map);
	// 중복 체크
	int userCnt(HashMap<String, Object> map);
	
	int selectUser(HashMap<String, Object> map);
}
