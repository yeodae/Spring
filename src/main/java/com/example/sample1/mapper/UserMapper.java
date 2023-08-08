package com.example.sample1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sample1.model.User;


@Mapper
public interface UserMapper {
	int insertUser(HashMap<String, Object> map);
	// 중복 체크
	int userCnt(HashMap<String, Object> map);
	
	User selectUser(HashMap<String, Object> map);
	
	int updateUserCnt(HashMap<String, Object> map);
	
	int resetUserCnt(HashMap<String, Object> map);
	
	User userCheckId(HashMap<String, Object> map);
	
}
