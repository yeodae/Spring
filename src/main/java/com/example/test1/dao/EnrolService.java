package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Enrol;
import com.example.test1.model.Student;

public interface EnrolService {
	List<Enrol> selectEnrolList(HashMap<String, Object> map);
	
	int removeEnrol(HashMap<String, Object> map);
	
	Student searchEnrolInfo(HashMap<String, Object> map);
	
	int editEnrol(HashMap<String, Object> map);
	
	Student searchUserInfo(HashMap<String, Object> map);
}
