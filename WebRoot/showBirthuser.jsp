<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"%>
<%@ page import="model.user" %>
<%@ page import="Dao.userDao" %>
<%@page import="java.text.SimpleDateFormat"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'showBirthuser.jsp' starting page</title>
    
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
a{
    color: black;
	text-decoration: none;
}
</style>
</head>
<body >
	  <center>
	        <h1>Happy Birthday!</h1>
			<table class="table" cellspacing="0"
				style="font-size: 20px;width: auto;height: auto;">
				<%
					List<user> ul = new userDao().getAlluser();
					boolean state=true;
					Date date=new Date();
					String today=new SimpleDateFormat("MMdd").format(date);
					//out.print(today);
					for (user u : ul) {
					     //out.print(new SimpleDateFormat("MMdd").format(u.getBirthday()));
					    if(new SimpleDateFormat("MMdd").format(u.getBirthday()).equals(today)){
					        state=false;
				%>
				<tr>
					<td>卡号:<%=u.getId()%></td>
					<td>姓名:<%=u.getName() %></td>
					<td>性别:<%=u.getSex() %></td>
					<td>电话:<%=u.getPhone() %></td>
					<td>生日:<%=new SimpleDateFormat("yyyy-MM-dd").format(u.getBirthday()) %></td>
					<td>卡类型:<%if(u.getAll_state()==1){
				                        %>通用卡<%}else{ %>非通用卡<%}%></td>
				</tr>
				<%
				        }
					}
				%>
			</table>
			<%if(state){ %>
			<h1>今日无生日会员</h1>
			<% }%>
	</center>
</body>
</html>
