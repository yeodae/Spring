package com.example.test1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.test1.model.Emp;
import com.example.test1.model.Student;
import com.example.test1.model.Student2;
import com.example.test1.model.Subject;

@Mapper
public interface StudentMapper {
	// 학생 테이블 조회
	List<Student> selectStudentList(HashMap<String, Object> map);
	// Emp 테이블 조회
	List<Emp> selectEmpList(HashMap<String, Object> map);
	// Subject 과목 테이블 조회
	List<Subject> selectSubjectList(HashMap<String, Object> map);
	// 학생 상세정보
	Student selectStudentInfo(HashMap<String, Object> map);
	//검색결과가 단일(stuNo 한명)이기때문에 리스트에 담을 필요없다.
	
	// student 학생 삭제
	int deleteStudent(HashMap<String, Object> map);
	// emp 삭제
	int deleteEmp(HashMap<String, Object> map);
	// emp 수정
	int updateEmp(HashMap<String, Object> map);
	
	//student2 테이블 조회
	List<Student2> selectlastStudentList(HashMap<String, Object> map);
	//student2 삭제
	int deletelastStudent(HashMap<String, Object> map);
}
