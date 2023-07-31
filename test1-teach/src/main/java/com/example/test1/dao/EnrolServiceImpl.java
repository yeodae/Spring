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
	public List<Enrol> selectEnrolList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.selectEnrolList(map);
	}

	@Override
	public int removeEnrol(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.deleteEnrol(map);
	}

	@Override
	public Student searchEnrolInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.selectEnrolInfo(map);
	}

	@Override
	public int editEnrol(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.updateEnrol(map);
	}

	@Override
	public Student searchUserInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return enrolMapper.selectUserInfo(map);
	}

}
