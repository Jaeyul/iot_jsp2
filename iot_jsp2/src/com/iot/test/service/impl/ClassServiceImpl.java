package com.iot.test.service.impl;

import java.util.List;

import com.google.gson.Gson;
import com.iot.test.dao.ClassDAO;
import com.iot.test.dao.impl.ClassDAOImpl;
import com.iot.test.service.ClassService;
import com.iot.test.vo.ClassInfo;

public class ClassServiceImpl implements ClassService{
	
	private ClassDAO cdao = new ClassDAOImpl();
	Gson gs = new Gson();
	

	@Override
	public List<ClassInfo> getClassList() {
		
		return cdao.selectClassList();
	}
	
	
	

}
