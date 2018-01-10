package com.iot.test.dao;

import java.util.List;

import com.iot.test.vo.ClassInfo;
import com.iot.test.vo.UserClass;

public interface ClassDAO {
	
	List<ClassInfo> selectClassList();
	public int insertClass(ClassInfo ci);
	public int deleteClass(ClassInfo ci);
	public int updateClass(ClassInfo ci);
}
