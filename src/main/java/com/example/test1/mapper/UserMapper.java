package com.example.test1.mapper;

import java.util.HashMap;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserMapper {
	// 회원가입 insert
	int insertUser(HashMap<String, Object> map);
	// 아이디 중복체크
	int userCnt(HashMap<String, Object> map);
}
