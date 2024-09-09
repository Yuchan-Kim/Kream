package com.javaex.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.javaex.dao.MainDao;
import com.javaex.vo.MainVo;

@Service
public class MainService {
	
	@Autowired
	private MainDao mainDao;
	
	/* 메인화면 전체 리스트 */
	public List<MainVo> exeList() {
		System.out.println("MainService.exeList()");
		
		List<MainVo> mainList = mainDao.selectList();
		
		return mainList;
	}
	
	
	/* 브랜드 리스트 */
	public List<MainVo> exeBrandList() {
		System.out.println("MainService.exeBrandList()");
		
		List<MainVo> brandList =mainDao.selectBrandList();
		
		return brandList;
	}
	
	
	/* 컬러 리스트 */
	public List<MainVo> exeColorList() {
		System.out.println("MainService.exeColorList()");
		
		List<MainVo> colorList =mainDao.selectColorList();
		
		return colorList;
	}


}
