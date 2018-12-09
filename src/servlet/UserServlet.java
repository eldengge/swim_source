package servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.google.gson.Gson;

import Service.StatisticService;
import Service.TimeTableService;
import Service.courseService;
import Service.userService;
import model.Statistic;
import model.course;
import model.timetable;
import model.user;
import util.Constant;
import util.WebUtil;
import vo.Page;

public class UserServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;
	
	private userService usersv=new userService();
	
	private TimeTableService timetablesv=new TimeTableService();
	
	private courseService courseSv=new courseService();
	
	private StatisticService statisticService=new StatisticService();

	protected void queryUserById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Integer id=Integer.parseInt(request.getParameter("id"));
		List<timetable> timeTables=null;
		user queryUser=usersv.queryUserById(id);
		if(queryUser==null) {
			request.setAttribute("message", "无此用户");
		}else if(queryUser.getEnd_date().compareTo(new Date())<=0){
			request.setAttribute("message", "此卡已过期");
		}else {
			if(queryUser.getAll_state()==0) {
				timeTables=timetablesv.queryTimeTablesByUserId(id);
				request.setAttribute("timetables", timeTables);
			}
			request.setAttribute("queryUser", queryUser);
		}
		request.getRequestDispatcher("/index.jsp?num=10").forward(request, response);
	}
	protected void swipeCard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		Integer id=Integer.parseInt(request.getParameter("id"));
		String user_name=request.getParameter("user_name");
		String all_state = request.getParameter("all_state");
		Statistic statistic=new Statistic();
		statistic.setUser_id(id);
		statistic.setUser_name(user_name);
		statistic.setCourse_name("--");
		statistic.setCreat_date(new Date());
		if(all_state.equals("1")) {
			statistic.setMethod("通用卡");
			user swipe_user=usersv.queryUserById(id);
			if(swipe_user.getSwim_number()!=0) {
				usersv.swipeCard(id);
				statisticService.addStatistic(statistic);
			}
		}else {
			statistic.setMethod("非通用卡");
			String timetable_id=request.getParameter("timetable_id");
			timetable swipeTimetable=timetablesv.queryTimeTableById(timetable_id);
			statistic.setCourse_name(swipeTimetable.getCourse_name());
			
			timetablesv.swipeCard(swipeTimetable);
			statisticService.addStatistic(statistic);
			Gson gson=new Gson();
			Map<String,Object> result=new HashMap<String,Object>();
			result.put("swipeTimetableId", swipeTimetable.getId());
			String json = gson.toJson(result);
			//System.out.println(json);
			response.getWriter().println(json);
		}
	}
	protected void queryPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer totalno=0;
		List<user> users=null;
		Integer pageno=Integer.parseInt(request.getParameter("pageno"));
		Integer pagesize=Integer.parseInt(request.getParameter("pagesize"));
		Page<user> page=new Page<user>(pagesize, pageno);
		if(request.getParameter("value").toString().equals("")) {
			//System.out.println(request.getParameter("value").toString());
			totalno=usersv.getAllCount();
			users=usersv.queryPageData(page.getStartIndex(),page.getPagesize());
		}else {
			//System.out.println(request.getParameter("value").toString());
			Integer searchMethod=Integer.parseInt(request.getParameter("searchMethod").toString());
			switch(searchMethod) {
				case 1:{
					Integer userId=Integer.parseInt(request.getParameter("value").toString());
					totalno=usersv.getCountByUserId(userId);
					users=usersv.queryPageDataByUserId(page.getStartIndex(),page.getPagesize(),userId);
				} break;
				case 2:{
					String username=request.getParameter("value");
					totalno=usersv.getCountByUserName(username);
					users=usersv.queryPageDataByUserName(page.getStartIndex(),page.getPagesize(),username);
				}break;
				case 3:{
					String phone=request.getParameter("value").toString();
					totalno=usersv.getCountByPhone(phone);
					users=usersv.queryPageDataByPhone(page.getStartIndex(),page.getPagesize(),phone);
				}break;
			}
		}
		page.setTotalno(totalno);
		page.setDatas(users);
		List<String> endDates=new ArrayList<String>();
		if(users!=null) {
			for (user userr : users) {
				endDates.add(userr.getEnd_date().toString());
			}
		}
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("page",page);
		params.put("endDates", endDates);
		Gson gson=new Gson();
		String json = gson.toJson(params);
		//System.out.println(json);
		response.getWriter().println(json);
	}
	protected void queryUserMessageById(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(request.getParameter("id").toString());
		user queryUser=usersv.queryUserById(id);
		List<timetable> timetables = timetablesv.queryTimeTablesByUserId(id);
		request.setAttribute("queryUser", queryUser);
		request.setAttribute("timetables", timetables);
		request.getRequestDispatcher("/jsp/user/ShowUserMessage.jsp").forward(request, response);
	}
	protected void queryUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id").toString());
		user queryUser=usersv.queryUserById(id);
		Map<String,Object> param=new HashMap<String,Object>();
		if(queryUser==null) {
			param.put("success", false);
		}else {
			param.put("success", true);
			param.put("allState", queryUser.getAll_state());
		}
		Gson gson=new Gson();
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}
	protected void queryTimetable(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id = Integer.parseInt(request.getParameter("id").toString());
		List<timetable> timetableList=timetablesv.queryTimeTablesByUserId(id);
		List<course> courseList=courseSv.queryCourse();
		Map<String,Object> param=new HashMap<String,Object>();
		param.put("timetableList", timetableList);
		param.put("courseList", courseList);
		Gson gson=new Gson();
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}
	protected void userAddCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Gson gson=new Gson();
		timetable newTimetable=new timetable();
		newTimetable=WebUtil.getBean(newTimetable, request);
		newTimetable.setCreat_date(new Date());
		newTimetable.setUpdate_date(new Date());
		Map<String,Object> param=new HashMap<String,Object>();
		timetable queryTimetable=
				timetablesv.queryTimeTableByUserIdAndCourseName(newTimetable.getUser_id(),newTimetable.getCourse_name());
		if(queryTimetable!=null) {
			param.put("success", false);
		}else {
			timetablesv.insertTimetable(newTimetable);
			param.put("success", true);
		}
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}
	protected void beforeAddNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer id=Integer.parseInt(request.getParameter("id").toString());
		user queryUser=usersv.queryUserById(id);
		List<timetable> timetables = timetablesv.queryTimeTablesByUserId(id);
		request.setAttribute("queryUser", queryUser);
		request.setAttribute("timetables", timetables);
		request.getRequestDispatcher("/jsp/user/AddNumber.jsp").forward(request, response);
	}
	protected void AddNumber(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer allState=Integer.parseInt(request.getParameter("allState"));
		switch(allState) {
			case 1:{
				String userId=request.getParameter("userId");
				String number=request.getParameter("number");
				usersv.updateNumberById(userId,number);
			}break;
			case 0:{
				String[] ids = request.getParameterValues("ids[]");
				String[] nums = request.getParameterValues("nums[]");
				timetablesv.updateNumbersByIds(ids,nums);
			}break;
		}
	}
	protected void beforeUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("id"));
		user queryUser=usersv.queryUserById(id);
		request.setAttribute("queryUser", queryUser);
		request.getRequestDispatcher("/jsp/user/UpdateUserMessage.jsp").forward(request, response);
	}
	protected void queryPass(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Integer id=Integer.parseInt(request.getParameter("id"));
		user queryUser=usersv.queryUserById(id);
		Gson gson=new Gson();
		Map<String,Object> param=new HashMap<String,Object>();
		if(queryUser.getEnd_date().compareTo(new Date())>0) {
			param.put("success", true);
		}else {
			param.put("success", false);
		}
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}
	
}
