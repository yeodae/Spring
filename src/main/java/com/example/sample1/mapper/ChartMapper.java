package com.example.sample1.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.sample1.model.Chart;

@Mapper
public interface ChartMapper {
	List<Chart> selectCoinList();
	
	List<Chart> selectDomainList();
	
	List<Chart> selectLanList(HashMap<String, Object> map);
	//Coin테이블 다른 이름 리스트2개 출력
	List<Chart> selectGazua(HashMap<String, Object> map);
	
	
	
}
