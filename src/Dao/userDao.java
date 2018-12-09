package Dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import dbutil.dbutil;

import model.user;

public class userDao extends BasicDao<user>{
	public int adduser(Object[] params) {
		Connection conn = dbutil.getConnection();
		String sql = "" + "insert into user"
				+ "(id,name,age,sex,birthday,img,parent_name,phone,creat_date,update_date," +
				"all_state,swim_number,card_state,end_date)" + "values("
				+ "?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return update(sql, params);
	}

	public user getuser(int id) {
 		user mu=null;
 		Connection conn=dbutil.getConnection();
 		String sql=""+" select * from user where id=?";
 		try {
 			PreparedStatement ptmt=conn.prepareStatement(sql);
 			ptmt.setInt(1, id);
 			ResultSet rs=ptmt.executeQuery();
 			while(rs.next()){
 				mu=new user();
 				mu.setId(rs.getInt("id"));
 				mu.setAge(rs.getInt("age"));
 				mu.setName(rs.getString("name"));
 				mu.setSex(rs.getString("sex"));
 				mu.setBirthday(rs.getDate("birthday"));
 				mu.setImg(rs.getString("img"));
 				mu.setParent_name(rs.getString("parent_name"));
 				mu.setPhone(rs.getString("phone"));
 				mu.setCreat_date(rs.getDate("creat_date"));
 				mu.setEnd_date(rs.getDate("end_date"));
 				mu.setAll_state(rs.getInt("all_state"));
 				mu.setSwim_number(rs.getInt("swim_number"));
 			}
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
		return mu;
	}
	
	public List<user> search(int what,String str){
		List<user> myList=new ArrayList<user>();
		user myuser=null;
		Connection conn=dbutil.getConnection();
		StringBuffer sql=new StringBuffer();
		sql.append(" select * from user where ");
		if(what==1){
			sql.append(" phone="+str);
		}else if(what==2){
			String strr="'"+str+"'";
			sql.append(" name="+strr);
		}
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql.toString());
			ResultSet rs=ptmt.executeQuery();
			while(rs.next()){
				myuser=new user();
				myuser.setId(rs.getInt("id"));
				myuser.setImg(rs.getString("img"));
				myuser.setName(rs.getString("name"));
 				myuser.setSex(rs.getString("sex"));
 				myuser.setAll_state(rs.getInt("all_state"));
				myList.add(myuser);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return myList;
	}
	public List<user> getAlluser(){
		List<user> ul=new ArrayList<user>();
 		user mu=null;
 		Connection conn=dbutil.getConnection();
 		StringBuffer sql=new StringBuffer();
 		sql.append(" select * from user ");
 		try {
 			PreparedStatement ptmt=conn.prepareStatement(sql.toString());
 			ResultSet rs=ptmt.executeQuery();
 			while(rs.next()){
 				mu=new user();
 				mu.setId(rs.getInt("id"));
 				mu.setName(rs.getString("name"));
 				mu.setSex(rs.getString("sex"));
 				mu.setBirthday(rs.getDate("birthday"));
 				mu.setPhone(rs.getString("phone"));
 				mu.setCreat_date(rs.getDate("creat_date"));
 				mu.setEnd_date(rs.getDate("end_date"));
 				mu.setAll_state(rs.getInt("all_state"));
 			    ul.add(mu);
 			}
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		return ul;
     }
	public void update_u_num(int id,int swim_number){
		Connection conn=dbutil.getConnection();
		String sql=""+"update user set swim_number=? where id=?";
		try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			ptmt.setInt(1, swim_number);
			ptmt.setInt(2, id);
			ptmt.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public user queryUserById(Integer id) {
		// TODO Auto-generated method stub
		user queryUser=null;
 		String sql=""+" select * from user where id=?";
 		queryUser=getBean(sql, id);
		return queryUser;
	}

	public void subtractSwimNumber(Integer id) {
		// TODO Auto-generated method stub
		String sql="update user set swim_number=swim_number-1 where id=?";
		update(sql, id);
	}

	public Integer getAllCount() {
		// TODO Auto-generated method stub
		String sql="select count(*) from user";
		int count = (int)getCount(sql);
		return count;
	}

	public List<user> queryPageData(Integer startIndex, Integer pagesize) {
		// TODO Auto-generated method stub
		String sql="select * from user order by creat_date desc limit ?,? ";
		return getList(sql,startIndex,pagesize);
	}

	public void updateNumberById(String userId, String number) {
		// TODO Auto-generated method stub
		String sql="update user set swim_number=? where id=?";
		update(sql, number,userId);
	}

	public Integer getCountByUserId(Integer userId) {
		// TODO Auto-generated method stub
		String sql="select count(*) from user where id=?";
		int count = (int)getCount(sql,userId);
		return count;
	}

	public List<user> queryPageDataByUserId(Integer startIndex, Integer pagesize, Integer userId) {
		// TODO Auto-generated method stub
		String sql="select * from user where id=? order by creat_date desc limit ?,? ";
		return getList(sql,userId,startIndex,pagesize);
	}

	public Integer getCountByUserName(String user_name) {
		// TODO Auto-generated method stub
		String sql="select count(*) from user where name like ?";
		int count=(int)getCount(sql, user_name);
		return count;
	}

	public List<user> queryPageDataByUserName(Integer startIndex, Integer pagesize, String username) {
		// TODO Auto-generated method stub
		String sql="select * from user where name like ? order by creat_date desc limit ?,? ";
		return getList(sql,username,startIndex,pagesize);
	}

	public Integer getCountByPhone(String phone) {
		// TODO Auto-generated method stub
		String sql="select count(*) from user where phone=?";
		int count = (int)getCount(sql,phone);
		return count;
	}

	public List<user> queryPageDataByPhone(Integer startIndex, Integer pagesize, String phone) {
		// TODO Auto-generated method stub
		String sql="select * from user where phone=? order by creat_date desc limit ?,? ";
		return getList(sql,phone,startIndex,pagesize);
	}

	public void updateUserById(user new_user) {
		// TODO Auto-generated method stub
		String sql="update user set name=?,age=?,sex=?,birthday=?,"
				+ "	img=?,parent_name=?,phone=?,update_date=?,end_date=? where id=?";
		update(sql, new_user.getName(),new_user.getAge(),new_user.getSex(),
				new_user.getBirthday(),new_user.getImg(),new_user.getParent_name(),new_user.getPhone(),
				new_user.getUpdate_date(),new_user.getEnd_date(),new_user.getId());
	}
}
