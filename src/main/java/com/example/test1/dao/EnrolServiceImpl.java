package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.EnrolMapper;
import com.example.test1.model.Enrol;
import com.example.test1.model.Student;

@Service
public class EnrolServiceImpl implements EnrolService{
	
	@Autowired
	EnrolMapper enrolMapper;

	@Override
	public List<Enrol> searchEnrolList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.selectEnrolList(map);
	}

	@Override
	public int removeEnrol(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.deleteEnrol(map);
	}

	@Override
	public HashMap<String, Object> enrolInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student stu = enrolMapper.searchEnrolInfo(map);
		resultMap.put("info", stu);
		return resultMap;
	}

	@Override
	public int enrolUpdate(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.enrolEdit(map);
	}
	
	

}
