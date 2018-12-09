package Dao;

import model.Admin;

public class AdminDao extends BasicDao<Admin>{

	public Admin queryAdmin(String username, String password) {
		// TODO Auto-generated method stub
		String sql="select * from admin where username=? and password=?";
		return getBean(sql, username,password);
	}

}
