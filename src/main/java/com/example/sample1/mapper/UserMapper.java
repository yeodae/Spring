package com.example.sample1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sample1.model.User;

@Mapper
public interface UserMapper {
	//유저 리스트 출력
	List<User> selectUserList(HashMap<String, Object> map);
	// 중복 체크
	int userCnt(HashMap<String, Object> map);
	//아이디 패스워드 검사
	User selectUser(HashMap<String, Object> map);
	//로그인실패 카운트
	int updateUserCnt(HashMap<String, Object> map);
	//로그인 카운트 초기화
	int resetUserCnt(HashMap<String, Object> map);
	//패스워드틀릴때 cnt조회
	User userCheckId(HashMap<String, Object> map);
	//회원가입
	int insertUser(HashMap<String, Object> map);
}
