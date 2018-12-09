package Dao;

import java.util.List;

import model.Statistic;

public class StatisticDao extends BasicDao<Statistic>{

	public void insertStatistic(Object[] newParamArray) {
		// TODO Auto-generated method stub
		String sql="insert statistics values(null,?,?,?,?,?)";
		update(sql, newParamArray);
	}

	public Integer getAllCount() {
		// TODO Auto-generated method stub
		String sql="select count(*) from statistics";
		int count = (int)getCount(sql);
		return count;
	}

	public List<Statistic> queryPageData(Integer startIndex, Integer pagesize) {
		// TODO Auto-generated method stub
		String sql="select * from statistics order by creat_date desc limit ?,? ";
		return getList(sql,startIndex,pagesize);
	}

	public Integer getCountByUserId(Integer userId) {
		// TODO Auto-generated method stub
		String sql="select count(*) from statistics where user_id=?";
		int count=(int)getCount(sql, userId);
		return count;
	}

	public List<Statistic> queryPageDataByUserId(Integer startIndex, Integer pagesize, Integer userId) {
		// TODO Auto-generated method stub
		String sql="select * from statistics where user_id=? order by creat_date desc limit ?,?";
		return getList(sql, userId,startIndex,pagesize);
	}

	public Integer getCountByUserName(String username) {
		// TODO Auto-generated method stub
		String sql="select count(*) from statistics where user_name like ?";
		int count=(int)getCount(sql, username);
		return count;
	}

	public List<Statistic> queryPageDataByUserName(Integer startIndex, Integer pagesize, String username) {
		// TODO Auto-generated method stub
		String sql="select * from statistics where user_name like ? order by creat_date desc limit ?,?";
		return getList(sql, username,startIndex,pagesize);
	}

}
