package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Service.courseService;
import model.course;

public class CourseServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	private courseService courseSv=new courseService();
       
	protected void queryCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<course> courseList=courseSv.queryCourse();
		List<String> createDates=new ArrayList<String>();
		for (course course : courseList) {
			createDates.add(course.getCreat_date().toString());
		}
		Gson gson=new Gson();
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("courseList", courseList);
		params.put("createDates", createDates);
		String json = gson.toJson(params);
		response.getWriter().println(json);
	}

	protected void insertCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String courseName =request.getParameter("courseName");
		course queryCourse=courseSv.queryCourseByName(courseName);
		Map<String, Object> param=new HashMap<String,Object>();
		if(queryCourse==null) {
			course insertCourse=new course();
			insertCourse.setName(courseName);
			insertCourse.setCreat_date(new Date());
			courseSv.insertCourse(insertCourse);
			param.put("success", true);
		}else {
			param.put("success", false);
		}
		Gson gson=new Gson();
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}
	protected void delCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] courseIds = request.getParameterValues("courseIds[]");
		//System.out.println(Arrays.toString(courseIds));
		courseSv.delCourse(courseIds);
	}

}
