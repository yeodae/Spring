package com.example.test1.dao;

import java.util.HashMap;
import java.util.List;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Student2;
import com.example.test1.model.Subject;

public interface StudentService {
	// 게시글 조회
	List<Student> searchStudentList(HashMap<String, Object> map);
	// emp 조회 
	List<Emp> searchEmpList(HashMap<String, Object> map);
	// subject 조회
	List<Subject> searchSubjectList(HashMap<String, Object> map);
	// 학생 상세 조회
	HashMap<String, Object> searchStudentInfo(HashMap<String, Object> map);
	// 학생 삭제
	int removeStudent(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	// EMP 삭제
	int removeEmp(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	// EMP 수정
	int updateEmp(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
	
	//student2 조회
	List<Student2> searchlastStudentList(HashMap<String, Object> map);
	//student2 삭제
	int removelastStudent(HashMap<String, Object> map);// 구분하기위해 맵퍼와 서비스 각각 다른이름 사용
}
