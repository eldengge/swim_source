package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import dbutil.dbutil;
import model.course;

public class courseDao extends BasicDao<course>{
     public void addCourse(course new_c){
    	 Connection conn = dbutil.getConnection();
 		String sql = "" + "insert into course"
 				+ "(name,teacher_name,creat_date)" + "values("
 				+ "?,?,current_date())";
 		try {
 			PreparedStatement ptmt = conn.prepareStatement(sql);
 			ptmt.setString(1, new_c.getName());
 			ptmt.execute();
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
     }
     
     public List<course> getAllcourse(){
    	List<course> cl=new ArrayList<course>();
 		course mc=null;
 		Connection conn=dbutil.getConnection();
 		StringBuffer sql=new StringBuffer();
 		sql.append(" select * from course ");
 		try {
 			PreparedStatement ptmt=conn.prepareStatement(sql.toString());
 			ResultSet rs=ptmt.executeQuery();
 			while(rs.next()){
 				mc=new course();
 				mc.setId(rs.getInt("id"));
 				mc.setName(rs.getString("name"));
 			    cl.add(mc);
 			}
 		} catch (SQLException e) {
 			// TODO Auto-generated catch block
 			e.printStackTrace();
 		}
 		return cl;
     }
     public course getCbyId(int c_id){
    	 course c=new course();
    	 Connection conn=dbutil.getConnection();
    	 String sql=""+" select * from course where id=?";
    	 try {
			PreparedStatement ptmt=conn.prepareStatement(sql);
			 ptmt.setInt(1, c_id);
			 ResultSet rs=ptmt.executeQuery();
			 while(rs.next()){
					c.setId(rs.getInt("id"));
	 				c.setName(rs.getString("name"));
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	 return c;
     }

	public List<course> queryCourse() {
		// TODO Auto-generated method stub
		String sql="select * from course";
		return getList(sql);
	}

	public course queryCourseByName(String courseName) {
		// TODO Auto-generated method stub
		String sql="select * from course where name=?";
		return getBean(sql, courseName);
	}

	public void insertCourse(course insertCourse) {
		// TODO Auto-generated method stub
		String sql="insert course values (null,?,?)";
		update(sql, insertCourse.getName(),insertCourse.getCreat_date());
	}

	public void delCourse(String[] courseIds) {
		// TODO Auto-generated method stub
		String sql="delete from course where id=?";
		for (String courseId : courseIds) {
			update(sql, courseId);
		}
	}
}
