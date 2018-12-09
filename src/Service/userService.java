package Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Map;

import Dao.userDao;
import model.user;
import util.DateUtil;
import util.WebUtil;

public class userService {
	private userDao userdao=new userDao();

	public user insertUser(Map<String, Object> parameterMap) {
		// TODO Auto-generated method stub
		user new_user = new user();
		try {
			Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(parameterMap.get("birthday").toString());
			Date end_date=new SimpleDateFormat("yyyy-MM-dd").parse(parameterMap.get("end_date").toString());
			parameterMap.put("birthday", birthday);
			parameterMap.put("end_date", end_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		WebUtil.getBean(new_user, parameterMap);
		new_user.setCreat_date(new Date());
		new_user.setUpdate_date(new Date());
		new_user.setCard_state(1);
		//System.out.println(new_user);
		Object[] params=WebUtil.beanToArray(new_user);
		//System.out.println(Arrays.toString(params));
		int len=userdao.adduser(params);
		return len>=1?new_user:null;
	}

	public user queryUserById(Integer id) {
		// TODO Auto-generated method stub
		return userdao.queryUserById(id);
	}

	public void swipeCard(Integer id) {
		// TODO Auto-generated method stub
		userdao.subtractSwimNumber(id);
	}

	public Integer getAllCount() {
		// TODO Auto-generated method stub
		return userdao.getAllCount();
	}

	public List<user> queryPageData(Integer startIndex, Integer pagesize) {
		// TODO Auto-generated method stub
		return userdao.queryPageData(startIndex,pagesize);
	}

	public void updateNumberById(String userId, String number) {
		// TODO Auto-generated method stub
		userdao.updateNumberById(userId, number);
	}

	public Integer getCountByUserId(Integer userId) {
		// TODO Auto-generated method stub
		return userdao.getCountByUserId(userId);
	}

	public List<user> queryPageDataByUserId(Integer startIndex, Integer pagesize, Integer userId) {
		// TODO Auto-generated method stub
		return userdao.queryPageDataByUserId(startIndex, pagesize, userId);
	}

	public Integer getCountByUserName(String username) {
		// TODO Auto-generated method stub
		String user_name="%"+username+"%";
		return userdao.getCountByUserName(user_name);
	}

	public List<user> queryPageDataByUserName(Integer startIndex, Integer pagesize, String username) {
		// TODO Auto-generated method stub
		String user_name="%"+username+"%";
		return userdao.queryPageDataByUserName(startIndex, pagesize, user_name);
	}

	public Integer getCountByPhone(String phone) {
		// TODO Auto-generated method stub
		return userdao.getCountByPhone(phone);
	}

	public List<user> queryPageDataByPhone(Integer startIndex, Integer pagesize, String phone) {
		// TODO Auto-generated method stub
		return userdao.queryPageDataByPhone(startIndex,pagesize,phone);
	}

	public void updateUser(Map<String, Object> parameterMap) {
		// TODO Auto-generated method stub
		user new_user = new user();
		try {
			Date birthday = new SimpleDateFormat("yyyy-MM-dd").parse(parameterMap.get("birthday").toString());
			Date end_date=new SimpleDateFormat("yyyy-MM-dd").parse(parameterMap.get("end_date").toString());
			parameterMap.put("birthday", birthday);
			parameterMap.put("end_date", end_date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		WebUtil.getBean(new_user, parameterMap);
		new_user.setUpdate_date(new Date());
		userdao.updateUserById(new_user);
	}

}
