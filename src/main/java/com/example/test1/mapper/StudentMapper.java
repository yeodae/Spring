package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Subject;

@Mapper
public interface StudentMapper {
	// 학생 목록
	List<Student> selectStudentList(HashMap<String, Object> map);
	// emp 테이블 조회
	List<Emp> selectEmpList(HashMap<String, Object> map);
	// 과목 목록
	List<Subject> selectSubjectList(HashMap<String, Object> map);
	// 학생 상세정보
	Student selectStudentInfo(HashMap<String, Object> map);
	
	int deleteStudent(HashMap<String, Object> map);
	
	int deleteEmp(HashMap<String, Object> map);
	
	int updateEmp(HashMap<String, Object> map);
}
