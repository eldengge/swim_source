package util;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.mchange.v2.c3p0.ComboPooledDataSource;


public class DBUtil {
	private static ThreadLocal<Connection> local=new ThreadLocal<Connection>();
	private static DataSource ds=new ComboPooledDataSource("swimc3p0");
	public static DataSource getDataSource(){
		return ds;
	}
	public static Connection getConnection(){
		Connection conn=local.get();
		if(conn==null) {
			try {
				conn=ds.getConnection();
				local.set(conn);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return conn;
	}
	public static void closeConnection(){
		Connection conn=local.get();
		try {
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		local.remove();
	}
}
