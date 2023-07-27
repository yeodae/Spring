package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.User;

@Mapper
public interface UserMapper {
	// 회원가입 insert
	int insertUser(HashMap<String, Object> map);
	// 아이디 중복체크
	int userCnt(HashMap<String, Object> map);
}
