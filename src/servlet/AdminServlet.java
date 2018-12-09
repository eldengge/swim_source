package servlet;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import Service.AdminService;
import model.Admin;
import util.MD5Util;

/**
 * Servlet implementation class AdminServlet
 */
public class AdminServlet extends BaseServlet {
	private static final long serialVersionUID = 1L;
	
	private AdminService adminService=new AdminService();
       
	protected void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username=request.getParameter("username");
		String password=MD5Util.digest(request.getParameter("password"));
		Admin loginAdmin=adminService.queryAdmin(username,password);
		Gson gson=new Gson();
		Map<String,Object> param=new HashMap<String, Object>();
		if(loginAdmin!=null) {
			request.getSession().setAttribute("loginAdmin", loginAdmin);
			param.put("success", true);
		}else {
			param.put("success", false);
		}
		String json = gson.toJson(param);
		response.getWriter().println(json);
	}

	
	protected void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.removeAttribute("loginAdmin");
		response.sendRedirect(request.getContextPath()+"/jsp/admin/AdminLogin.jsp");
	}

}
