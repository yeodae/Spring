package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Enrol;
import com.example.test1.model.Student;

@Mapper
public interface EnrolMapper {
	//테이블 호출
	List<Enrol> selectEnrolList(HashMap<String, Object> map);
	//성적 삭제
	int deleteEnrol(HashMap<String, Object> map);
	//단일 학생 조회
	Student searchEnrolInfo(HashMap<String, Object> map);
	//학생 이름 변경
	int enrolEdit(HashMap<String, Object> map);
}
