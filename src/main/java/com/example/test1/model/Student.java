package com.example.test1.model;

import lombok.Data;

@Data
public class Student {
	private String stuNo;
	private String stuName;
	private String stuDept;
	private String stuGrade;
	private String stuClass;
	private String stuGender;
	private String stuHeight;
	private String stuWeight;
	private String enrGrade;
	private String avgGrade;
	private boolean banYn = false;
}
