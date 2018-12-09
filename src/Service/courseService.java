package Service;

import java.util.List;

import Dao.courseDao;
import model.course;

public class courseService {
	private courseDao coursedao=new courseDao();

	public List<course> queryCourse() {
		// TODO Auto-generated method stub
		return coursedao.queryCourse();
	}

	public course queryCourseByName(String courseName) {
		// TODO Auto-generated method stub
		return coursedao.queryCourseByName(courseName);
	}

	public void insertCourse(course insertCourse) {
		// TODO Auto-generated method stub
		coursedao.insertCourse(insertCourse);
	}

	public void delCourse(String[] courseIds) {
		// TODO Auto-generated method stub
		coursedao.delCourse(courseIds);
	}

}
