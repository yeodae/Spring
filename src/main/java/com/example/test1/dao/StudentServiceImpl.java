package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.test1.mapper.StudentMapper;
import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Student2;
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
		return list; // 생략가능
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
		resultMap.put("message", "성공");
		return resultMap;
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
	public int updateEmp(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.updateEmp(map);
	}

	@Override
	public List<Student2> searchlastStudentList(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.selectlastStudentList(map);
	}

	@Override
	public int removelastStudent(HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		return studentMapper.deletelastStudent(map);
	}
	
	

}
