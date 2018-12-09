package Dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import util.DBUtil;


public class BasicDao <T>{
//	private DataSource ds=DBUtil.getDataSource();
	private QueryRunner qr=new QueryRunner();
	private Class<T> type;
	@SuppressWarnings("unchecked")
	public BasicDao(){
		Type genericSuperclass = this.getClass().getGenericSuperclass();
		ParameterizedType parameterizedType=(ParameterizedType)genericSuperclass;
		Type[] actualTypeArguments = parameterizedType.getActualTypeArguments();
		type=(Class<T>)actualTypeArguments[0];
	}
	public int update(String sql,Object...args){
		Connection conn=DBUtil.getConnection();
		int len=0;
		try {
			len=qr.update(conn,sql,args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return len;
	}
	public T getBean(String sql,Object...args){
		Connection conn=DBUtil.getConnection();
		T bean=null;
		try {
			bean=qr.query(conn,sql,new BeanHandler<T>(type),args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return bean;
	}
	public List<T> getList(String sql,Object...args){
		Connection conn=DBUtil.getConnection();
		List<T> list=null;
		try {
			list=qr.query(conn,sql, new BeanListHandler<T>(type), args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return list;
	}
	public void batch(String sql,Object[][] params){
		Connection conn=DBUtil.getConnection();
		try {
			qr.batch(conn,sql, params);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}
	public long getCount(String sql,Object...args){
		Connection conn=DBUtil.getConnection();
		long count=0L;
		try {
			count = qr.query(conn, sql, new ScalarHandler<Long>(), args);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		return count;
	}
}
