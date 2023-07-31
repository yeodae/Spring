package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

public interface StudentService {
	// 게시글 조회
	List<Student> searchStudentList(HashMap<String, Object> map);
	
	List<Emp> searchEmpList(HashMap<String, Object> map);
	
	List<Subject> searchSubjectList(HashMap<String, Object> map);
	
	HashMap<String, Object> searchStudentInfo(HashMap<String, Object> map);
	
	Student searchStudentInfo2(HashMap<String, Object> map);
	
	int removeStudent(HashMap<String, Object> map);
	
	int removeEmp(HashMap<String, Object> map);
	// 사원 수정
	int editEmp(HashMap<String, Object> map);
}
