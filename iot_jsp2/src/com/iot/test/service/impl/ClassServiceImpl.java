package com.iot.test.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.google.gson.Gson;
import com.iot.test.dao.ClassDAO;
import com.iot.test.dao.UserDAO;
import com.iot.test.dao.impl.ClassDAOImpl;
import com.iot.test.dao.impl.UserDAOImpl;
import com.iot.test.service.ClassService;
import com.iot.test.vo.ClassInfo;

public class ClassServiceImpl implements ClassService{
	private UserDAO uc = new UserDAOImpl();
	private ClassDAO cdao = new ClassDAOImpl();
	Gson gs = new Gson();
	

	@Override
	public List<ClassInfo> getClassList() {
		
		return cdao.selectClassList();
	}


	@Override
	public String insertClass(HttpServletRequest req) {
		String json = req.getParameter("param");
		ClassInfo ci = gs.fromJson(json, ClassInfo.class);	
		int result = cdao.insertClass(ci);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "반 개설에 실패했습니다.");
		if(result == 1) {
			rm.put("result", "ok");
			rm.put("msg", "반 개설에 성공하셨습니다.");	
				
		}		
		
		return gs.toJson(rm);
	}


	@Override
	public String deleteClass(HttpServletRequest req) {
		int ciNo = Integer.parseInt(req.getParameter("ciNo"));
		ClassInfo ci = new ClassInfo();
		ci.setCiNo(ciNo);
		int result = cdao.deleteClass(ci);
		ArrayList<HashMap<String, Object>> userListWhenCiNo = uc.selectUserListWhereCiNo(ciNo);		
		HashMap<String, String> rm = new HashMap<String, String>();
		if(userListWhenCiNo.size() == 0) {
			rm.put("result", "no");
			rm.put("msg", "반 폐강에 실패했습니다.");
			if(result == 1) {
				rm.put("result", "ok");
				rm.put("msg", "반 폐강에 성공하셨습니다.");					
			}					
			return gs.toJson(rm);	
			
		}else {			
			rm.put("result", "no");
			rm.put("msg", "반에 학생이 있어요!");
			
			return gs.toJson(rm);				
		}		
	}


	@Override
	public String updateClass(HttpServletRequest req) {
		String json = req.getParameter("param");
		ClassInfo ci = gs.fromJson(json, ClassInfo.class);	
		int result = cdao.updateClass(ci);
		HashMap<String, String> rm = new HashMap<String, String>();
		rm.put("result", "no");
		rm.put("msg", "반 수정에 실패했습니다.");
		if(result == 1) {
			rm.put("result", "ok");
			rm.put("msg", "반 수정에 성공하셨습니다.");	
				
		}			
		return gs.toJson(rm);
	}
	
	
	

}
