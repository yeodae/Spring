package com.example.sample1.service;

import java.util.HashMap;
import java.util.List;

import com.example.sample1.model.Chart;

public interface ChartService {
	List<Chart> searchCoinList();
	
	List<Chart> searchDomainList();
	
	HashMap<String, Object> searchLanList();
	
	//COIN테이블 다른이름을가진 리스트 출력
	HashMap<String, Object> searchGazua();
	
}
