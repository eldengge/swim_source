package servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import Service.StatisticService;
import model.Statistic;
import vo.Page;

public class StatisticServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private StatisticService statisticService=new StatisticService();

	protected void queryPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Integer totalno=0;
		List<Statistic> Statistics=null;
		Integer pageno=Integer.parseInt(request.getParameter("pageno"));
		Integer pagesize=Integer.parseInt(request.getParameter("pagesize"));
		Page<Statistic> page=new Page<Statistic>(pagesize, pageno);
		if(request.getParameter("value").toString().equals("")) {
			//System.out.println(request.getParameter("value").toString());
			totalno=statisticService.getAllCount();
			Statistics=statisticService.queryPageData(page.getStartIndex(),page.getPagesize());
		}else {
			//System.out.println(request.getParameter("value").toString());
			Integer searchMethod=Integer.parseInt(request.getParameter("searchMethod").toString());
			switch(searchMethod) {
				case 1:{
					Integer userId=Integer.parseInt(request.getParameter("value").toString());
					totalno=statisticService.getCountByUserId(userId);
					Statistics=statisticService.queryPageDataByUserId(page.getStartIndex(),page.getPagesize(),userId);
				} break;
				case 2:{
					String username=request.getParameter("value").toString();
					totalno=statisticService.getCountByUserName(username);
					Statistics=statisticService.queryPageDataByUserName(page.getStartIndex(),page.getPagesize(),username);
				}break;
			}
		}
		page.setTotalno(totalno);
		page.setDatas(Statistics);
		List<String> createDates=new ArrayList<String>();
		if(Statistics!=null) {
			for (Statistic statistic : Statistics) {
				createDates.add(statistic.getCreat_date().toString());
			}
		}
		Map<String,Object> params=new HashMap<String,Object>();
		params.put("page",page);
		params.put("createDates", createDates);
		Gson gson=new Gson();
		String json = gson.toJson(params);
		//System.out.println(json);
		response.getWriter().println(json);
		
	}
	protected void xxx(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
