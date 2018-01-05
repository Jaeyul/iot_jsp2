package com.iot.test.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.iot.test.common.DBCon;
import com.iot.test.dao.UserDAO;
import com.iot.test.vo.UserClass;

public class UserDAOImpl implements UserDAO {

	@Override
	public ArrayList<UserClass> selectUserList() {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;	
		ArrayList<UserClass> userList = new ArrayList<UserClass>();
		try {
			con = DBCon.getCon();
			String sql = "select * from user_info ui, class_info ci where ui.cino = ci.cino";
			ps = con.prepareStatement(sql);			
			rs = ps.executeQuery();			
			while(rs.next()) {
				UserClass uc = new UserClass();
				uc.setAddress(rs.getString("address"));
				uc.setCiDesc(rs.getString("cidesc"));
				uc.setCiName(rs.getString("ciname"));
				uc.setCiNo(rs.getInt("cino"));
				uc.setUiAge(rs.getInt("uiage"));
				uc.setUiId(rs.getString("uiId"));
				uc.setUiName(rs.getString("uiname"));
				uc.setUiNo(rs.getInt("uino"));
				uc.setUiPwd(rs.getString("uipwd"));
				uc.setUiRegdate(rs.getString("uiregdate"));	
				userList.add(uc);								
			}			
		}catch(Exception e) {
			e.printStackTrace();		
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}			
		}			
		return userList;		
	}

	@Override
	public UserClass selectUser(int uiNo) {
		
	
		return null;
	}
	
	@Override
	public UserClass selectUser(String uiId) {
		Connection con = null;
		PreparedStatement ps = null;
		ResultSet rs = null;		
		try {
			con = DBCon.getCon();
			String sql = "select * from user_info ui, class_info ci where ui.cino = ci.cino and ui.uiid=?";
			ps = con.prepareStatement(sql);
			ps.setString(1, uiId);
			rs = ps.executeQuery();			
			while(rs.next()) {
				UserClass uc = new UserClass();
				uc.setAddress(rs.getString("address"));
				uc.setCiDesc(rs.getString("cidesc"));
				uc.setCiName(rs.getString("ciname"));
				uc.setCiNo(rs.getInt("cino"));
				uc.setUiAge(rs.getInt("uiage"));
				uc.setUiId(rs.getString("uiId"));
				uc.setUiName(rs.getString("uiname"));
				uc.setUiNo(rs.getInt("uino"));
				uc.setUiPwd(rs.getString("uipwd"));
				uc.setUiRegdate(rs.getString("uiregdate"));				
				return uc;				
			}		
		}catch(Exception e) {
			e.printStackTrace();		
		}
		finally {
			if(rs!=null) {
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}			
		}			
		return null;
	}

	@Override
	public int insertUser(UserClass uc) {
		Connection con = null;
		PreparedStatement ps = null;						
		try {
			con = DBCon.getCon();
			String sql = "insert into user_info(uiname, uiage, uiid, uipwd, cino, address, uiRegdate)\r\n" + 
					"values(?,?,?,?,?,?, now());";
			ps = con.prepareStatement(sql);
			ps.setString(1, uc.getUiName());
			ps.setInt(2, uc.getUiAge());
			ps.setString(3, uc.getUiId());
			ps.setString(4, uc.getUiPwd());
			ps.setInt(5, uc.getCiNo());
			ps.setString(6, uc.getAddress());
			
			return ps.executeUpdate();			
			
		}catch(Exception e) {
			e.printStackTrace();		
		}
		finally {			
			if(ps!=null) {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			if(con!=null) {
				try {
					con.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}			
		}	
		
		return 0;
	}

	@Override
	public int updateUser(UserClass uc) {
	
		return 0;
	}

	@Override
	public int deleteUser(UserClass uc) {
		
		return 0;
	}

	

}
