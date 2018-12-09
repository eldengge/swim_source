package Service;

import java.util.Arrays;
import java.util.List;

import Dao.StatisticDao;
import model.Statistic;
import util.WebUtil;

public class StatisticService {
	
	private StatisticDao statisticDao=new StatisticDao();
	public void addStatistic(Statistic statistic) {
		// TODO Auto-generated method stub
		Object[] paramArray = WebUtil.beanToArray(statistic);
		Object[] newParamArray = Arrays.copyOfRange(paramArray, 1, paramArray.length);
		statisticDao.insertStatistic(newParamArray);
	}
	public Integer getAllCount() {
		// TODO Auto-generated method stub
		return statisticDao.getAllCount();
	}
	public List<Statistic> queryPageData(Integer startIndex, Integer pagesize) {
		// TODO Auto-generated method stub
		return statisticDao.queryPageData(startIndex, pagesize);
	}
	public Integer getCountByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return statisticDao.getCountByUserId(userId);
	}
	public List<Statistic> queryPageDataByUserId(Integer startIndex, Integer pagesize, Integer userId) {
		// TODO Auto-generated method stub
		return statisticDao.queryPageDataByUserId(startIndex, pagesize,userId);
	}
	public Integer getCountByUserName(String username) {
		// TODO Auto-generated method stub
		String user_name="%"+username+"%";
		return statisticDao.getCountByUserName(user_name);
	}
	public List<Statistic> queryPageDataByUserName(Integer startIndex, Integer pagesize, String username) {
		// TODO Auto-generated method stub
		String user_name="%"+username+"%";
		return statisticDao.queryPageDataByUserName(startIndex, pagesize,user_name);
	}
	

}
