package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Enrol;

public interface EnrolService {
	//성적 테이블 조회
	List<Enrol> searchEnrolList(HashMap<String, Object> map);
	//성적 삭제
	int removeEnrol(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	//상세 조회
	HashMap<String, Object> enrolInfo(HashMap<String, Object> map);
	//학생 이름 변경
	int enrolUpdate(HashMap<String, Object> map);
}
