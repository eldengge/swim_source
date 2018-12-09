<%@ page language="java" import="java.util.*"
	contentType="text/html; charset=utf-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page import="Dao.userDao"%>
<%@ page import="model.user"%>
<%@ page import="Dao.timetableDao"%>
<%@ page import="model.timetable"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'showUser.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style type="text/css">
.table td {
	border: 1px solid black;
}

.centertd {
	text-align: center;
}
</style>
</head>

<body>
	<center>
		<%
			user myuser = new userDao().getuser(Integer.parseInt(request
					.getParameter("u_id")));
			List<timetable> tl=new timetableDao().queryTimeTablesByUserId(Integer.parseInt(request
					.getParameter("id")));
		%>
		<table class="table" cellspacing="0"
			style="font-size: 25px;width: 550px;height: auto;">
			<tr>
				<td rowspan="4" class="centertd"><img
					src="photo/<%=myuser.getImg()%>" style="width: 150px;height: 200px">
				</td>
				<td class="centertd">卡号:<%=myuser.getId()%></td>
			</tr>
			<tr>
				<td class="centertd">姓名:<%=myuser.getName()%></td>
			</tr>
			<tr>
				<td class="centertd">性别:<%=myuser.getSex()%></td>
			</tr>
			<tr>
				<td class="centertd">年龄:<%=myuser.getAge()%></td>
			</tr>
			<tr>
				<td colspan="2">生日:<%=new SimpleDateFormat("yyyy-MM-dd").format(myuser
					.getBirthday())%></td>
			</tr>
			<tr>
				<td colspan="2">家长姓名:<%=myuser.getParent_name()%></td>
			</tr>
			<tr>
				<td colspan="2">创建时间:<%=new SimpleDateFormat("yyyy-MM-dd").format(myuser.getCreat_date())%></td>
			</tr>
			<tr>
				<td colspan="2">到期时间:<%=new SimpleDateFormat("yyyy-MM-dd").format(myuser.getEnd_date())%></td>
			</tr>
			<tr>
				<td colspan="2">联系电话:<%=myuser.getPhone()%></td>
			</tr>
			<tr>
				<td colspan="2">卡类型(通用卡/非通卡):<%
					if (myuser.getAll_state() == 1) {
				%>通用卡<%
					} else {
				%>非通用卡<%
					}
				%>
				</td>
			</tr>
			<%
				if (myuser.getAll_state() == 1) {
			%>
			<tr>
				<td colspan="2">次数:<%=myuser.getSwim_number()%></td>
			</tr>
			<%
				}else{
			%>
		     <%if(tl.size()!=0&&tl!=null){%>
		    <tr>
				<td colspan="2" class="centertd">拥有课程</td>
			</tr>
			<%for(timetable t:tl){%>
			<tr>
				<td colspan="2" class="centertd" >
				   名称:<%=t.getCourse_name()%>&nbsp;
				   次数:<%=t.getNumber() %>
				</td>
			</tr>
			<%} } }%>
		</table>
		<a href="index.jsp?num=7">点击返回</a>
	</center>
</body>
</html>
