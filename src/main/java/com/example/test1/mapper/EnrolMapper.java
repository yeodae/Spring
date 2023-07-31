package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Enrol;
import com.example.test1.model.Student;

@Mapper
public interface EnrolMapper {
	List<Enrol> selectEnrolList(HashMap<String, Object> map);

	int deleteEnrol(HashMap<String, Object> map);
	
	Student selectEnrolInfo(HashMap<String, Object> map);
	
	int updateEnrol(HashMap<String, Object> map);
	
	Student selectUserInfo(HashMap<String, Object> map);
}
