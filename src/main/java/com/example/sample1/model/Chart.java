package com.example.sample1.model;

import lombok.Data;

@Data
public class Chart {
	private String cName;
	private int price;
	private String pDate;
	private String domain;
	private int joinCnt;
	
	private String language;
	private String year;
	private String useCnt;
}
