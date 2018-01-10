package com.iot.test.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.iot.test.vo.UserClass;

public interface UserDAO {
	
	ArrayList<UserClass> selectUserList();
	ArrayList<HashMap<String, Object>> selectUserListWhereCiNo(int ciNo);
	UserClass selectUser(int uiNo);
	UserClass selectUser(String uiId);
	int insertUser(UserClass uc);
	int updateUser(UserClass uc);
	int deleteUser(UserClass uc);
	
	
	
	

}
