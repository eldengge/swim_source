package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import model.timetable;
import dbutil.dbutil;

public class timetableDao extends BasicDao<timetable>{
     public void addtimet(timetable myt){
 		String sql = "" + "insert into timetable"
 				+ "(course_id,course_name,teacher_name,user_id,creat_date,update_date,number)" + "values("
 				+ "?,?,?,?,current_date(),current_date(),?)";
     }
     public void update_number(int id,int number){
    	 Connection conn=dbutil.getConnection();
 		String sql=""+" update timetable "+" set number=?,update_date=current_date() " +
 				"where id=?";
 		try {
 			PreparedStatement ptmt=conn.prepareStatement(sql);
 			ptmt.setInt(1, number);
 			ptmt.setInt(2, id);
 			ptmt.execute();
 			
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
     }
	public List<timetable> queryTimeTablesByUserId(Integer id) {
		// TODO Auto-generated method stub
		String sql=""+" select * from timetable where user_id=?";
		return getList(sql, id);
	}
	public timetable queryTimeTableById(String timetable_id) {
		// TODO Auto-generated method stub
		String sql="select * from timetable where id=?";
		return getBean(sql, timetable_id);
	}
	public void delTimetableById(int id) {
		// TODO Auto-generated method stub
		String sql="delete from timetable where id=?";
		update(sql, id);
	}
	public void updateNumberById(int id, Date date) {
		// TODO Auto-generated method stub
		String sql="update timetable set number=number-1,update_date=? where id=?";
		update(sql, date,id);
	}
	public timetable queryTimeTableByUserIdAndCourseName(Integer user_id, String course_name) {
		// TODO Auto-generated method stub
		String sql="select * from timetable where user_id=? and course_name=?";
		return getBean(sql, user_id,course_name);
	}
	public void insertTimetable(Object[] timetableParam) {
		// TODO Auto-generated method stub
		String sql="insert timetable values(?,?,?,?,?,?,?)";
		update(sql, timetableParam);
	}
	public void updateNumbersByIds(String[] ids, String[] nums) {
		// TODO Auto-generated method stub
		String sql="update timetable set number=? where id=?";
		for(int i=0;i<ids.length;++i) {
			update(sql, nums[i],ids[i]);
		}
	}
	
}
