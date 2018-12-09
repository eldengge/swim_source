package Service;

import java.util.Date;
import java.util.List;

import Dao.timetableDao;
import model.timetable;
import util.WebUtil;

public class TimeTableService {
	private timetableDao ttDao=new timetableDao();

	public List<timetable> queryTimeTablesByUserId(Integer id) {
		// TODO Auto-generated method stub
		return ttDao.queryTimeTablesByUserId(id);
	}

	public timetable queryTimeTableById(String timetable_id) {
		// TODO Auto-generated method stub
		return ttDao.queryTimeTableById(timetable_id);
	}

	public void swipeCard(timetable swipeTimetable) {
		// TODO Auto-generated method stub
		if(swipeTimetable.getNumber()<=1) {
			ttDao.delTimetableById(swipeTimetable.getId());
		}else {
			ttDao.updateNumberById(swipeTimetable.getId(),new Date());
		}
	}

	public timetable queryTimeTableByUserIdAndCourseName(Integer user_id, String course_name) {
		// TODO Auto-generated method stub
		return ttDao.queryTimeTableByUserIdAndCourseName(user_id,course_name);
	}

	public void insertTimetable(timetable newTimetable) {
		// TODO Auto-generated method stub
		Object[] timetableParam=WebUtil.beanToArray(newTimetable);
		ttDao.insertTimetable(timetableParam);
	}

	public void updateNumbersByIds(String[] ids, String[] nums) {
		// TODO Auto-generated method stub
		ttDao.updateNumbersByIds(ids, nums);
	}

}
