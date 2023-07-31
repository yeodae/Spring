package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	StudentMapper studentMapper;
	
	@Override
	public List<Student> searchStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentList(map);
	}

	@Override
	public List<Emp> searchEmpList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		List<Emp> list = studentMapper.selectEmpList(map);
		return list;
	}

	@Override
	public List<Subject> searchSubjectList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectSubjectList(map);
	}

	@Override
	public HashMap<String, Object> searchStudentInfo(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		Student stu = studentMapper.selectStudentInfo(map);
		resultMap.put("info", stu);
		resultMap.put("message", "검색 성공");
		return resultMap;
	}

	@Override
	public Student searchStudentInfo2(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectStudentInfo(map);
	}

	@Override
	public int removeStudent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.deleteStudent(map);
	}

	@Override
	public int removeEmp(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.deleteEmp(map);
	}

	@Override
	public int editEmp(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.updateEmp(map);
	}
}
