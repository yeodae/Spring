package com.example.sample1.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.sample1.mapper.ChartMapper;
import com.example.sample1.model.Chart;

@Service
public class ChartServiceImpl implements ChartService{
	
	@Autowired
	ChartMapper chartMapper;
	
	@Override
	public List<Chart> searchCoinList() {
		// TODO Auto-generated method stub
		return chartMapper.selectCoinList();
	}

	@Override
	public List<Chart> searchDomainList() {
		// TODO Auto-generated method stub
		return chartMapper.selectDomainList();
	}

	@Override
	public HashMap<String, Object> searchLanList() {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		List<Object> list = new ArrayList<Object>();
		
		String arr[] = {"JAVA", "PYTHON", "C", "C++", "C#"};
		for(int i=0; i<arr.length; i++) {
			map.put("name", arr[i]);
			list.add(chartMapper.selectLanList(map));
		}
		resultMap.put("list", list);
		return resultMap;
	}

	@Override
	public HashMap<String, Object> searchGazua() {
		// TODO Auto-generated method stub
		HashMap<String, Object> map = new HashMap<String, Object>();
		HashMap<String, Object> resultMap = new HashMap<String, Object>();
		
		map.put("cName", "ABC");
		List<Chart> abcList = chartMapper.selectGazua(map);
		map.put("cName", "귀살대");
		List<Chart> gsdList = chartMapper.selectGazua(map);
		map.put("cName", "um~Coin");
		List<Chart> umList = chartMapper.selectGazua(map);
		//1번 방안
		resultMap.put("abcList", abcList);
		resultMap.put("gsdList", gsdList);
		resultMap.put("umList", umList);
		
		//2번 방안 (확장성↑↑↑↑)
		List<Object> list = new ArrayList<Object>();
		list.add(abcList);
		list.add(gsdList);
		list.add(umList);
		resultMap.put("allList",list);
		return resultMap;
	}

}
